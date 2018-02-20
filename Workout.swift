//
//  Workout.swift
//  Summer-Excel
//
//  Created by SCHNASER, ETHAN; MARSHALL, MAX; and ABBOTT, JAKE on 12/7/17.
//  Copyright © 2017 DIstrict 196. All rights reserved.
//

import UIKit

class Workout: NSObject, NSCoding {
    
    var milesRan: Double!
    //Number of Miles ran. Default: nil
    
    var timeElapsed: Time!
    //Time it took to run miles entered(in minutes). Default: nil
    
    var date: Date!
    //The user is able to choose the date in which to log their workout
    
    var avgMilePace: Time!
    //The average amount of time it takes the user to run a mile based off of the miles and time they entered. Optional when logging a workout Default: nil
    
    var notes: String!
    //An optional string of characters the user enters when logging a run.
    
    var didAttend: Bool!
    
    override init()
    {
        milesRan = 0
        timeElapsed = Time(min: 0)
        date = Date()
        avgMilePace = Time(min: 0)
        notes = ""
        didAttend = false
    }
    
    required convenience init(coder decoder:NSCoder)
    {
        self.init()
        self.milesRan = decoder.decodeObject(forKey: "milesRan") as! Double
        self.timeElapsed = decoder.decodeObject(forKey: "timeElapsed") as! Time
        self.date = decoder.decodeObject(forKey: "date") as! Date
        self.avgMilePace = decoder.decodeObject(forKey: "avgMilePace") as! Time
        self.notes = decoder.decodeObject(forKey: "notes") as! String
        self.didAttend = decoder.decodeObject(forKey: "didAttend") as! Bool
    }

    convenience init(miles: Double, timeE: Time, theDate: Date, words: String, attend: Bool )
    {
        self.init()
        timeElapsed = timeE
        date = theDate
        if miles != 0.0 {
            avgMilePace = timeE.divideTime(number: miles)
        } else {
            avgMilePace = Time(min: 0)
        }
        notes = words
        milesRan = miles
        didAttend = attend
        
    }
    
    func encode(with aCoder: NSCoder) {
        if let milesRan = milesRan {aCoder.encode(milesRan, forKey: "mileRan")}
        if let timeElapsed = timeElapsed {aCoder.encode(timeElapsed, forKey: "timeElapsed")}
        if let date = date {aCoder.encode(date, forKey: "date")}
        if let notes = notes {aCoder.encode(notes, forKey: "notes")}
        if let didAttend = didAttend {aCoder.encode(didAttend, forKey: "didAttend")}
    }
    


        
    }
    
    


