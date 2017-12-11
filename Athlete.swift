//
//  Athlete.swift
//  Summer-Excel
//
//  Created by SCHNASER, ETHAN; MARSHALL, MAX; and ABBOTT, JAKE on 12/7/17.
//  Copyright © 2017 DIstrict 196. All rights reserved.
//

import UIKit

class Athlete: NSObject {
    
    //All the Athlete properties are found here
    var thisName: String
    var thisGrade: Int
    var workouts = [Workout]()
    var totalMiles: Double
    var totalTime = Time(sec: 0, min: 0, hou: 0)
    var attendance: Int
    var totalPace = Time(sec: 0, min: 0, hou: 0)
    
    init(name: String, grade: Int) {
        thisName = name
        thisGrade = grade
        totalMiles = 0
        attendance = 0
    }
    
    //Adds a new workout to the workout array
    func addWorkout(new: Workout) {
        workouts.append(new)
        
        //Calculates the total miles, minutes, and attendance and assigns it to the properties
        var sumMiles = 0.0
        let sumTime = Time(sec: 0, min: 0, hou: 0)
        var sumAttendance = 0
        for one in workouts {
            sumMiles += one.milesRan
            sumTime.addTime(time2: one.timeElapsed)
            if one.didAttend {
                sumAttendance += 1
            }
        }
        totalMiles = sumMiles
        totalTime = sumTime
        attendance = sumAttendance
        
        //Calculates overall pace
        
    }
    
    

}
