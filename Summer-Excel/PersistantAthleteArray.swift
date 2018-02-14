//
//  PersistentStringArray.swift
//  ScrollTest
//
//  Created by behnke on 6/24/17.
//  Copyright © 2017 George K Behnke. All rights reserved.
//

import Foundation
import os.log   // added for accessing persistent data storage

// ******* PART 2 ************** additional functionalities to basic class
class PersistentStringArray: NSObject, NSCoding {
    
    //MARK: Properties
    var stringNames: [String]
    var fileStoredName: String
    
    // ******* PART 1 **************
    //MARK: create structure to link object's Properties to variable names to archive
    struct PropertyKey {   // String values are same name as Properties they name
        static let stringNames = "stringNames"
        static let fileStoredName = "fileStoredName"
    }
    
    // ******* PART 3 **************
    //MARK: Archiving Paths
    // This creates a path to the ArchiveURL & its file's Directory
    var DocumentsDirectory: URL
    var ArchiveURL: URL
    
    //MARK: Initialization: Create the instance of the String to archive to long term storage
    //  This is the usual initializer for the class.
    //  names: the String array to archive
    //  fileName: the name of the file in which to store the archive
    init?(names: [String], fileName: String) {
        // The input Array must not be empty
        guard !names.isEmpty else {
            return nil
        }
        
        // Initialize properties.
        stringNames = names
        fileStoredName = fileName
        DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        ArchiveURL = DocumentsDirectory.appendingPathComponent(fileName)
    }
    
    // ******* PART 2a ********** Attach the property names to the archived names
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(stringNames, forKey: PropertyKey.stringNames)
    }
    
    // ******* PART 2b ********** create the instance with the archive information
    //Mark: coder initialization
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a names String array, the initializer should fail.
        guard let names = aDecoder.decodeObject(forKey: PropertyKey.stringNames) as? [String] else {
            os_log("Unable to decode the name for a PersistenStringArray object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Must call designated initializer to complete the object's instantiation.
        self.init(names: names, fileName: PropertyKey.fileStoredName)
    }
    
    // ****** PART 4a *******
    // Save String information to long term storage
    //  str: the String to be archived
    func archiveString(str: [String]) {
        stringNames = str
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(stringNames, toFile: ArchiveURL.path)
        if isSuccessfulSave {
            os_log("String successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save String...", log: OSLog.default, type: .error)
        }
    }
    
    // ****** PART 4b ******
    // Read (Restore) archived String information from storage
    // Returns nil if the String has not yet been archived to the file
    func restoreString() -> [String]?  {
        let tmp = NSKeyedUnarchiver.unarchiveObject(withFile: ArchiveURL.path) as? [String]
        return tmp
    }
}
