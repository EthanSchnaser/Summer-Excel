//
//  Athlete.swift
//  Summer-Excel
//
//  Created by SCHNASER, ETHAN; MARSHALL, MAX; and ABBOTT, JAKE on 12/7/17.
//  Copyright © 2017 DIstrict 196. All rights reserved.
//

import UIKit

class Athlete: NSObject, NSCoding {
    
    
    //All the Athlete properties are found here
    var thisName: String!
    var thisGrade: Int! = 0
    var workouts: [Workout]!
    var totalMiles: Double! = 0.0
    var totalTime: Time!
    var attendance: Int! = 0
    var averagePace: Time!
    
    override init()
    {
        thisName = ""
        thisGrade = 0
        workouts = [Workout]()
        totalMiles = 0
        totalTime = Time(min: 0)
        attendance = 0
        averagePace = Time(min: 0)
        
    }
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        self.thisName = decoder.decodeObject(forKey: "thisName") as! String
        self.thisGrade = decoder.decodeObject(forKey: "thisGrade") as! Int
        self.workouts = decoder.decodeObject(forKey: "workouts") as! [Workout]
        self.totalMiles = decoder.decodeObject(forKey: "totalMiles") as! Double
        self.totalTime = decoder.decodeObject(forKey: "totalTime") as! Time
        self.attendance = decoder.decodeObject(forKey: "attendance") as! Int
        self.averagePace = decoder.decodeObject(forKey: "averagePace") as! Time
    }
    
    convenience init(name: String, grade: Int) {
        self.init()
        thisName = name
        thisGrade = grade
        totalMiles = 0
        attendance = 0
        
    }
    
    
    func encode(with aCoder: NSCoder) {
        if let thisName = thisName {aCoder.encode(thisName, forKey: "thisName")}
        if let thisGrade = thisGrade {aCoder.encode(thisGrade, forKey: "thisGrade")}
        if let workouts = workouts {aCoder.encode(workouts, forKey: "workouts")}
        if let totalMiles = totalMiles {aCoder.encode(totalMiles, forKey: "totalMiles")}
        if let totalTime = totalTime {aCoder.encode(totalTime, forKey: "totalTime")}
        if let attendance = attendance {aCoder.encode(attendance, forKey: "attendance")}
        if let averagePace = averagePace {aCoder.encode(averagePace, forKey: "averagePace")}
    }
    
    
    //Adds a new workout to the workout array
    func addWorkout(new: Workout) {
        
        workouts.append(new)
        
        //Calculates the total miles, time, attendance, and pace and assigns it to the properties
        var sumMiles = 0.0
        let sumTime = Time(sec: 0, min: 0, hou: 0)
        var sumAttendance = 0
        let sumPace = Time(sec: 0, min: 0, hou: 0)
        for one in workouts {
            sumMiles += one.milesRan
            sumTime.addTime(time2: one.timeElapsed)
            if one.didAttend {
                sumAttendance += 1
            }
            sumPace.addTime(time2: one.timeElapsed)
        }
        totalMiles = sumMiles
        totalTime = sumTime
        attendance = sumAttendance
        
    }
    
    
    func weeklyTotals(day: Date) -> (Double, Time, Int, Time) {
        
        //finds the weekday of the Date object and the date of the previous sunday and next saturday
        let weekday = Calendar.current.component(.weekday, from: day) - 1
        let sunday = Date(timeInterval: TimeInterval(86400 * (-(weekday + 1))), since: day)
        let saturday = Date(timeInterval: TimeInterval(86400 * (6-weekday)), since: day)
        
        //Calculates the total weekly miles, time, attendance, and pace
        var sumMiles = 0.0
        let sumTime = Time(sec: 0, min: 0, hou: 0)
        var sumAttendance = 0
        let sumPace = Time(sec: 0, min: 0, hou: 0)
        for each in workouts {
            if (each.date < saturday) && (each.date < sunday) {
                sumMiles += each.milesRan
                sumTime.addTime(time2: each.timeElapsed)
                if each.didAttend {
                    sumAttendance += 1
                }
                sumPace.addTime(time2: each.avgMilePace)
            }
        }
        
        //Return a tuple of all the weekly totals
        return (sumMiles, sumTime, sumAttendance, sumPace)
        
        
        
        //get method that will return the workout object from theAthelte from the date from the paramter
        func getWorkout(selectedDate: Date) -> Workout {
            let count = theAthlete!.workouts.count
            for i in stride(from: 0, to: count, by: 1)
            {
                if(selectedDate == theAthlete?.workouts[i].date) {
                    return (theAthlete?.workouts[i])!
                }
            }
            return (theAthlete?.workouts[count])!
            
        }
        
    }
    
    
}
