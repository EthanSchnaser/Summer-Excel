//
//  HomepageView.swift
//  Summer-Excel
//
//  Created by SCHNASER, ETHAN on 12/11/17.
//  Copyright © 2017 DIstrict 196. All rights reserved.
//

import UIKit

class HomepageView: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var mileInput: UITextField!
    @IBOutlet weak var minuteInput: UITextField!
    @IBOutlet weak var notesInput: UITextView!
    @IBOutlet weak var attendanceInput: UISwitch!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var dateInput: UITextField!
    let datePicker = UIDatePicker()
    @IBOutlet weak var changeTeamateButton: UIButton!
    @IBOutlet weak var workoutPicker: UIPickerView!
    

    var workoutArr: [Workout] = []
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let str = "Workout \(row)"
        return str
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let workoutArr: [Workout] = (theAthlete?.getWorkoutArray(selectedDate: datePicker.date))!
        return workoutArr.count
    }
    
    
    
    
    
    
    
    
    
    @IBAction func milesEdited(_ sender: Any) {
        enabled()
    }
    
    @IBAction func minutesEdited(_ sender: Any) {
        enabled()
    }
    
    @IBAction func dateEdited(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dateInput.text = dateFormatter.string(from: self.datePicker.date)
        
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
        
        //attaches the workout to the athlete that is logged in
        theAthlete?.addWorkout(new: thisWorkout)
        
        //Clears the fields
        mileInput.text = nil
        minuteInput.text = nil
        notesInput.text = nil
        attendanceInput.isOn = false
        enabled()
        
        let data = NSKeyedArchiver.archivedData(withRootObject: theTeam)
        UserDefaults.standard.set(data, forKey: "theTeam")
        
        
    }
    
    
    func enabled() {
        if (mileInput.hasText && minuteInput.hasText) {
            enterButton.isEnabled = true
        } else {
            enterButton.isEnabled = false
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.datePickerMode = UIDatePickerMode.date
        dateInput.inputView = datePicker
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let strDate = dateFormatter.string(from: self.datePicker.date)
        dateInput.text = strDate


   
        
    }
    
    }
