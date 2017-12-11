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
    var seconds = 0
    //Integer that represents the minutes of the time the time object is representing
    var minutes = 0
    //Integer that represents the hours of the time the time object is representing
    var hours = 0
    
    //Initializes the seconds, minutes and hours of the time object
    init(sec: Int, min: Int, hou: Int)
    {
        seconds = sec
        minutes = min
        hours = hou
    }
    //This function will allow a time object to have another time object's instance variables added with their own
    //parameters: time2 = time object that will be added to the object being used to call.
    //return: none
    func addTime(time2: Time)
    {
        let sec = time2.seconds
        let min = time2.minutes
        let hou = time2.hours
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
        if (hours <= 0)
        {
            result = min + "minutes" + sec + "seconds"
        }
        else
        {
            result = hou + "hours" + min + "minutes" + sec + "seconds"
        }
        return result
    }

}
