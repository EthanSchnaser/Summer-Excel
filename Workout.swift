//
//  Workout.swift
//  Summer-Excel
//
//  Created by SCHNASER, ETHAN on 12/7/17.
//  Copyright © 2017 DIstrict 196. All rights reserved.
//

import UIKit

class Workout: NSObject {
    
    var milesRan: Double
    //Number of Miles ran. Default: nil
    
    var timeElapsed: Time
    //Time it took to run miles entered(in minutes). Default: nil
    
    var Date: Date
    //The user is able to choose the date in which to log their workout
    
    var avgMilePace: Double
    //The average amount of time it takes the user to run a mile based off of the miles and time they entered. Optional when logging a workout Default: nil
    
    var notes: String
    //An optional string of characters the user enters when logging a run.
    
    var didAttend: Bool
    
    init(miles: Double, timeE: Time, theDate: Date, milePace: Double, words: String, attend: Bool )
    {
        
        timeElapsed = timeE
        Date = theDate
        avgMilePace = milePace
        notes = words
        milesRan = miles
        didAttend = attend
        
    }
    

}
