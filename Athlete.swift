//
//  Athlete.swift
//  Summer-Excel
//
//  Created by SCHNASER, ETHAN on 12/7/17.
//  Copyright © 2017 DIstrict 196. All rights reserved.
//

import UIKit

class Athlete: NSObject {
    
    //All the Athlete properties are found here
    var thisName: String
    var thisGrade: Int
    var workouts = [Workout]()
    var totalMiles: Double
    var totalTime: Time
    var attendance: Int
    
    init(name: String, grade: Int) {
        thisName = name
        thisGrade = grade
        totalMiles = 0
        attendance = 0
        totalTime = Time(sec: 0, min: 0, hou: 0)
    }
    
    //Adds a new workout to the workout array
    func addWorkout(new: Workout) {
        workouts.append(new)
        
        //Calculates the total miles and assigns it to the toalMiles property
        var sum = 0.0
        for one in workouts {
            sum += one.milesRan
        }
        totalMiles = sum
    }
    
    

}
