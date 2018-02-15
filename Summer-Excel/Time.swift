//
//  Time.swift
//  Summer-Excel
//
//  Created by SCHNASER, ETHAN; MARSHALL, MAX; and ABBOTT, JAKE on 12/7/17.
//  Copyright © 2017 DIstrict 196. All rights reserved.
//

import UIKit

class Time: NSObject, NSCoding {
    //Integer that represents the seconds of the time the time object is representing
    var seconds: Int!
    //Integer that represents the minutes of the time the time object is representing
    var minutes: Int!
    
    
    override init()
    {
        seconds = 0
        minutes = 0
        
    }
    
    //Initializes the seconds, minutes and hours of the time object
    init(sec: Int, min: Int, hou: Int)
    {
        seconds = sec
        minutes = min
        
    }
    
    
    //Necessary for persistant data
    required convenience init(coder decoder: NSCoder)
    {
        self.init()
        self.seconds = decoder.decodeObject(forKey: "seconds") as! Int!
        self.minutes = decoder.decodeObject(forKey: "minutes") as! Int!
        
    }
    
    init(min: Int)
    {
        
        minutes = min
    }
    
    func encode(with aCoder: NSCoder)
    {
        if let seconds = seconds {aCoder.encode(seconds, forKey: "seconds")}
        if let minutes = minutes {aCoder.encode(minutes, forKey: "minutes")}
        
    }
    
    init(min: Int, sec: Int)
    {
        seconds = 0
        minutes = min
        
    }
    //This function will allow a time object to have another time object's instance variables added with their own
    //parameters: time2 = time object that will be added to the object being used to call.
    //return: none
    func addTime(time2: Time)
    {
        let sec = time2.seconds!
        let min = time2.minutes!
        
        seconds = seconds + sec
        minutes = minutes + min
    }
    
    //This function will allow the instance variables of a time object be listed in a way for the user to view the time that the object is associated with
    //parameters = none
    //return = String of letters and numbers representing the time the time object holds
    func toString() -> String
    {
        let min = "\(minutes)"
        return min
    }
    
    //Divides the time object by a double using floating point arithmetic
    func divideTime(number: Double) -> Time
    {
        let Result = Time(min: minutes)
        let num = Int(number)
        Result.minutes = minutes/num
        return Result
        
    }
    
}

