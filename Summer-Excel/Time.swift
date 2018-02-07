//
//  Time.swift
//  Summer-Excel
//
//  Created by SCHNASER, ETHAN; MARSHALL, MAX; and ABBOTT, JAKE on 12/7/17.
//  Copyright © 2017 DIstrict 196. All rights reserved.
//

import UIKit

class Time: NSObject {
    //Integer that represents the seconds of the time the time object is representing
    var seconds: Int!
    //Integer that represents the minutes of the time the time object is representing
    var minutes: Int!
    //Integer that represents the hours of the time the time object is representing
    var hours: Int!
    
    override init()
    {
        seconds = 0
        minutes = 0
        hours = 0
    }
    
    //Initializes the seconds, minutes and hours of the time object
    init(sec: Int, min: Int, hou: Int)
    {
        seconds = sec
        minutes = min
        hours = hou
    }
    
    
    //Necessary for persistant data
    required convenience init(aCoder decoder: NSCoder)
    {
        self.init()
        self.seconds = decoder.decodeObject(forKey: "seconds") as! Int
        self.minutes = decoder.decodeObject(forKey: "minutes") as! Int
        self.hours = decoder.decodeObject(forKey: "hours") as! Int
    }
    
    convenience init(min: Int)
    {
        self.init()
        minutes = min
    }
    
    func encode(with aCoder: NSCoder)
    {
        if let seconds = seconds {aCoder.encode(seconds, forKey: "seconds")}
        if let minutes = minutes {aCoder.encode(minutes, forKey: "minutes")}
        if let hours = hours {aCoder.encode(hours, forKey: "hours")}
    }
    
    init(min: Int, sec: Int)
    {
        seconds = 0
        minutes = min
        if(minutes < 60)
        {
            hours = 0
        }
        else{
            hours = minutes/60
            minutes = minutes - (hours * 60)
        }
    }
    //This function will allow a time object to have another time object's instance variables added with their own
    //parameters: time2 = time object that will be added to the object being used to call.
    //return: none
    func addTime(time2: Time)
    {
        let sec = time2.seconds!
        let min = time2.minutes!
        let hou = time2.hours!
        seconds = seconds + sec
        minutes = minutes + min
        hours = hours + hou
    }
    
    //This function will allow the instance variables of a time object be listed in a way for the user to view the time that the object is associated with
    //parameters = none
    //return = String of letters and numbers representing the time the time object holds
    func toString() -> String
    {
        var result = ""
        let min = String(minutes)
        let sec = String(seconds)
        let hou = String(hours)
        if hours == 0
        {
        result = min + " min " + sec + " sec"
        }
        else
        {
        result = hou + " hours " + min + " min " + sec + "sec"
        }
        return result

    }
    
    //Divides the time object by a double using floating point arithmetic
    func divideTime(number: Double) -> Time
    {
        let Result = Time(sec: seconds, min: minutes, hou: hours)
        let num = Int(number)
        Result.seconds = seconds/num
        Result.minutes = minutes/num
        Result.hours = hours/num
        return Result
        
    }

}
