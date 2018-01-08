//
//  HomepageView.swift
//  Summer-Excel
//
//  Created by SCHNASER, ETHAN on 12/11/17.
//  Copyright © 2017 DIstrict 196. All rights reserved.
//

import UIKit

class HomepageView: UIViewController {
    
    @IBOutlet weak var mileInput: UITextField!
    @IBOutlet weak var minuteInput: UITextField!
    @IBOutlet weak var notesInput: UITextView!
    @IBOutlet weak var attendanceInput: UISwitch!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var dateInput: UITextField!
    
    @IBAction func milesEdited(_ sender: Any) {
        enabled()
    }
    
    @IBAction func minutesEdited(_ sender: Any) {
        enabled()
    }
    
    
    
    @IBAction func pressEnter(_ sender: Any) {
        //casts the buttons to usable variables
        let theseMiles = Double(mileInput.text!)
        let theseMinutes = Int(minuteInput.text!)
        let thisTime = Time(min: theseMinutes!)
        let theseNotes = notesInput.text
        let attended = attendanceInput.isOn
        
        //creates the workout for this log
        let thisWorkout = Workout(miles: theseMiles!, timeE: thisTime, theDate: Date(), words: theseNotes!, attend: attended)
 
        
        
    }
    
    func enabled() {
        if (mileInput.hasText && minuteInput.hasText) {
            enterButton.isEnabled = true
        } else {
            enterButton.isEnabled = false
        }
    }
    
    
    
    }
