//
//  CloudKitConnection.swift
//  Summer-Excel
//
//  Created by MARSHALL, MAXWELL on 2/13/18.
//  Copyright © 2018 DIstrict 196. All rights reserved.
//

import UIKit
import CloudKit

extension CKError {
    public func isRecordNotFound() -> Bool {
        return isZoneNotFound() || isUnknownItem()
    }
    public func isZoneNotFound() -> Bool {
        return isSpecificErrorCode(code: .zoneNotFound)
    }
    public func isUnknownItem() -> Bool {
        return isSpecificErrorCode(code: .unknownItem)
    }
    public func isConflict() -> Bool {
        return isSpecificErrorCode(code: .serverRecordChanged)
    }
    public func isSpecificErrorCode(code: CKError.Code) -> Bool {
        var match = false
        if self.code == code {
            match = true
        }
        else if self.code == .partialFailure {
            // This is a multiple-issue error. Check the underlying array
            // of errors to see if it contains a match for the error in question.
            guard let errors = partialErrorsByItemID else {
                return false
            }
            for (_, error) in errors {
                if let cke = error as? CKError {
                    if cke.code == code {
                        match = true
                        break
                    }
                }
            }
        }
        return match
    }
    // ServerRecordChanged errors contain the CKRecord information
    // for the change that failed, allowing the client to decide
    // upon the best course of action in performing a merge.
    public func getMergeRecords() -> (CKRecord?, CKRecord?) {
        if code == .serverRecordChanged {
            // This is the direct case of a simple serverRecordChanged Error.
            return (clientRecord, serverRecord)
        }
        guard code == .partialFailure else {
            return (nil, nil)
        }
        guard let errors = partialErrorsByItemID else {
            return (nil, nil)
        }
        for (_, error) in errors {
            if let cke = error as? CKError {
                if cke.code == .serverRecordChanged {
                    // This is the case of a serverRecordChanged Error 
                    // contained within a multi-error PartialFailure Error.
                    return cke.getMergeRecords()
                }
            }
        }
        return (nil, nil)
    }
}

public protocol CloudKitNoteDatabaseDelegate {
    func cloudKitNoteRecordChanged(record: CKRecord)
}



// Create a custom zone to contain our note records. We only have to do this once.
public class CloudKitNoteDatabase {
    
    static let shared = CloudKitNoteDatabase()
    private init() {
        let zone = CKRecordZone(zoneName: "note-zone")
        zoneID = zone.zoneID
    }
    
    
    public var delegate: CloudKitNoteDatabaseDelegate?
    public var zoneID: CKRecordZoneID?

    private func createZone(completion: @escaping (Error?) -> Void) {
        let recordZone = CKRecordZone(zoneID: self.zoneID!)
        let operation = CKModifyRecordZonesOperation(recordZonesToSave: [recordZone], recordZoneIDsToDelete: [])
        operation.modifyRecordZonesCompletionBlock = { _, _, error in
            guard error == nil else {
                completion(error)
                return
            }
            completion(nil)
        }
        operation.qualityOfService = .utility
        let container = CKContainer.default()
        let db = container.privateCloudDatabase
        db.add(operation)
    }
    
    // Create the CloudKit subscription we’ll use to receive notification of changes.
    // The SubscriptionID lets us identify when an incoming notification is associated
    // with the query we created.
    public let subscriptionID = "cloudkit-note-changes"
    private let subscriptionSavedKey = "ckSubscriptionSaved"
    public func saveSubscription() {
        // Use a local flag to avoid saving the subscription more than once.
        let alreadySaved = UserDefaults.standard.bool(forKey: subscriptionSavedKey)
        guard !alreadySaved else {
            return
        }
        
        // If you wanted to have a subscription fire only for particular
        // records you can specify a more interesting NSPredicate here.
        // For our purposes we’ll be notified of all changes.
        let predicate = NSPredicate(value: true)
        let subscription = CKQuerySubscription(recordType: "note",
                                               predicate: predicate,
                                               subscriptionID: subscriptionID,
                                               options: [.firesOnRecordCreation, .firesOnRecordDeletion, .firesOnRecordUpdate])
        
        // We set shouldSendContentAvailable to true to indicate we want CloudKit
        // to use silent pushes, which won’t bother the user (and which don’t require
        // user permission.)
        let notificationInfo = CKNotificationInfo()
        notificationInfo.shouldSendContentAvailable = true
        subscription.notificationInfo = notificationInfo
        
        let operation = CKModifySubscriptionsOperation(subscriptionsToSave: [subscription], subscriptionIDsToDelete: [])
        operation.modifySubscriptionsCompletionBlock = { (_, _, error) in
            guard error == nil else {
                return
            }
            
            UserDefaults.standard.set(true, forKey: self.subscriptionSavedKey)
        }
        operation.qualityOfService = .utility
        
        let container = CKContainer.default()
        let db = container.privateCloudDatabase
        db.add(operation)
    }
    
    // Fetch a record from the iCloud database
    public func loadRecord(name: String, completion: @escaping (CKRecord?, Error?) -> Void) {
        let recordID = CKRecordID(recordName: name, zoneID: self.zoneID!)
        let operation = CKFetchRecordsOperation(recordIDs: [recordID])
        operation.fetchRecordsCompletionBlock = { records, error in
            guard error == nil else {
                completion(nil, error)
                return
            }
            guard let noteRecord = records?[recordID] else {
                // Didn't get the record we asked about?
                // This shouldn’t happen but we’ll be defensive.
                completion(nil, CKError.unknownItem as? Error)
                return
            }
            completion(noteRecord, nil)
        }
        operation.qualityOfService = .utility
        
        let container = CKContainer.default()
        let db = container.privateCloudDatabase
        db.add(operation)
    }
    
    // Save a record to the iCloud database
    public func saveRecord(record: CKRecord, completion: @escaping (Error?) -> Void) {
        let operation = CKModifyRecordsOperation(recordsToSave: [record], recordIDsToDelete: [])
        operation.modifyRecordsCompletionBlock = { _, _, error in
            guard error == nil else {
                guard let ckerror = error as? CKError else {
                    completion(error)
                    return
                }
                guard ckerror.isZoneNotFound() else {
                    completion(error)
                    return
                }
                // ZoneNotFound is the one error we can reasonably expect & handle here, since
                // the zone isn't created automatically for us until we've saved one record.
                // create the zone and, if successful, try again
                self.createZone() { error in
                    guard error == nil else {
                        completion(error)
                        return
                    }
                    self.saveRecord(record: record, completion: completion)
                }
                return
            }
            
            // Lazy save the subscription upon first record write
            // (saveSubscription is internally defensive against trying to save it more than once)
            self.saveSubscription()
            completion(nil)
        }
        operation.qualityOfService = .utility
        
        let container = CKContainer.default()
        let db = container.privateCloudDatabase
        db.add(operation)
    }
    
    // Handle receipt of an incoming push notification that something has changed.
    private let serverChangeTokenKey = "ckServerChangeToken"
    public func handleNotification() {
        // Use the ChangeToken to fetch only whatever changes have occurred since the last
        // time we asked, since intermediate push notifications might have been dropped.
        var changeToken: CKServerChangeToken? = nil
        let changeTokenData = UserDefaults.standard.data(forKey: serverChangeTokenKey)
        if changeTokenData != nil {
            changeToken = NSKeyedUnarchiver.unarchiveObject(with: changeTokenData!) as! CKServerChangeToken?
        }
        let options = CKFetchRecordZoneChangesOptions()
        options.previousServerChangeToken = changeToken
        let optionsMap = [zoneID!: options]
        let operation = CKFetchRecordZoneChangesOperation(recordZoneIDs: [zoneID!], optionsByRecordZoneID: optionsMap)
        operation.fetchAllChanges = true
        operation.recordChangedBlock = { record in
            self.delegate?.cloudKitNoteRecordChanged(record: record)
        }
        operation.recordZoneChangeTokensUpdatedBlock = { zoneID, changeToken, data in
            guard let changeToken = changeToken else {
                return
            }
            
            let changeTokenData = NSKeyedArchiver.archivedData(withRootObject: changeToken)
            UserDefaults.standard.set(changeTokenData, forKey: self.serverChangeTokenKey)
        }
        operation.recordZoneFetchCompletionBlock = { zoneID, changeToken, data, more, error in
            guard error == nil else {
                return
            }
            guard let changeToken = changeToken else {
                return
            }
            
            let changeTokenData = NSKeyedArchiver.archivedData(withRootObject: changeToken)
            UserDefaults.standard.set(changeTokenData, forKey: self.serverChangeTokenKey)
        }
        operation.fetchRecordZoneChangesCompletionBlock = { error in
            guard error == nil else {
                return
            }
        }
        operation.qualityOfService = .utility
        
        let container = CKContainer.default()
        let db = container.privateCloudDatabase
        db.add(operation)
    }
    
    
    
}
