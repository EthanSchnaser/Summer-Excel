//
//  Workout.swift
//  Summer-Excel
//
//  Created by SCHNASER, ETHAN; MARSHALL, MAX; and ABBOTT, JAKE on 12/7/17.
//  Copyright © 2017 DIstrict 196. All rights reserved.
//

import UIKit

class Workout: NSObject, NSCoding {

    
    
    var milesRan: Double
    //Number of Miles ran. Default: nil
    
    var timeElapsed: Time
    //Time it took to run miles entered(in minutes). Default: nil
    
    var date: Date
    //The user is able to choose the date in which to log their workout
    
    var avgMilePace: Time
    //The average amount of time it takes the user to run a mile based off of the miles and time they entered. Optional when logging a workout Default: nil
    
    var notes: String
    //An optional string of characters the user enters when logging a run.
    
    var didAttend: Bool
    

    
    
    init(miles: Double, timeE: Time, theDate: Date, words: String, attend: Bool )
    {
        timeElapsed = timeE
        date = theDate
        if miles != 0.0
        {
            avgMilePace = timeE.divideTime(number: miles)
        }
        else
        {
            avgMilePace = Time(min: 0)
        }
        notes = words
        milesRan = miles
        didAttend = attend
        
        
    }
    
    required convenience init?(coder decoder: NSCoder)
    {
        let miles = decoder.decodeDouble(forKey: "milesRan")
        let timePassed = decoder.decodeObject(forKey: "timeElapsed") as? Time
        let day = decoder.decodeObject(forKey: "date") as? Date
        decoder.decodeObject(forKey: "avgMilePace")
        let word = decoder.decodeObject(forKey: "notes") as? String
        let Attend = decoder.decodeBool(forKey: "didAttend")
        self.init(miles: miles, timeE: timePassed!, theDate: day!, words: word!, attend: Attend)
    }
    
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(self.milesRan, forKey: "milesRan")
        aCoder.encode(self.timeElapsed, forKey: "timeElapsed")
        aCoder.encode(self.date, forKey: "date")
        aCoder.encode(self.avgMilePace, forKey: "avgMilePace")
        aCoder.encode(self.notes, forKey: "notes")
        aCoder.encode(self.didAttend, forKey: "didAttend")
    }

    
    
    
    
}


        

    
    


