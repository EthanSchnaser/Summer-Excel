//
//  PersonalDataView.swift
//  Summer-Excel
//
//  Created by SCHNASER, ETHAN on 12/11/17.
//  Copyright © 2017 DIstrict 196. All rights reserved.
//

import UIKit



class PersonalDataView: UIViewController{
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var runDate: UILabel!
    @IBOutlet weak var milesButton: UITextField!
    @IBOutlet weak var timeButton: UITextField!
    @IBOutlet weak var weeklyStatsPU: UIButton!
    @IBOutlet weak var totalStatsPU: UIButton!
    @IBOutlet weak var noteSection: UITextView!

    
    @IBAction func changeDate(_ sender: AnyObject) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let strDate = dateFormatter.string(from: self.datePicker.date)
        self.runDate.text = strDate
        //everytime the date is changed in the datePicker, the label changes with it.
        let miles = theAthlete?.getWorkout(selectedDate: datePicker.date).milesRan
        let milesStr = "\(miles ?? 0)"
        milesButton.text = milesStr
        let minutes = theAthlete?.getWorkout(selectedDate: datePicker.date).timeElapsed
        timeButton.text = minutes?.toString()
        noteSection.text = theAthlete?.getWorkout(selectedDate: datePicker.date).notes
        //sets the miles, time and notes section to the current value stored for that athlete on that day
    
        
    }
    

    @IBAction func editWorkout(_ sender: Any) {
        
        milesButton.isEnabled = true
        timeButton.isEnabled = true
        if (noteSection.text == "No Workout Logged") {
            noteSection.text = ""
        }
        noteSection.isEditable = true
        
    }
    

    
    @IBAction func doneEditing(_ sender: Any) {
        
        //casts the buttons to usable variables
       let theseMiles = Double(milesButton.text!)
       let theseMinutes = Int(timeButton.text!)
       let thisTime = Time(min: theseMinutes!)
       let theseNotes = noteSection.text
       
        theAthlete?.getWorkout(selectedDate: datePicker.date).milesRan = theseMiles!
        theAthlete?.getWorkout(selectedDate: datePicker.date).timeElapsed = thisTime
        theAthlete?.getWorkout(selectedDate: datePicker.date).notes = theseNotes!
        
        milesButton.isEnabled = false
        timeButton.isEnabled = false
        noteSection.isEditable = false
        
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        datePicker.datePickerMode = UIDatePickerMode.date
        //sets the display of the datePicker to mm dd yyyy
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let strDate = dateFormatter.string(from: self.datePicker.date)
        self.runDate.text = strDate
        //sets the inital display date to the date datePicker is set to (Today)
        //selectedWorkout = theAthlete?.getWorkout(selectedDate: datePicker.date)
        //pulls the workout object for the selected datefor further use in the code
        
        
        //milesButton.text = String(theAthlete?.getWorkout(selectedDate: datePicker.date).milesRan)
        let miles = theAthlete?.getWorkout(selectedDate: datePicker.date).milesRan
        let milesStr = "\(miles ?? 0)"
        milesButton.text = milesStr
        
        let minutes = theAthlete?.getWorkout(selectedDate: datePicker.date).timeElapsed
        timeButton.text = minutes?.toString()
        //sets the miles and time button to the current value stored for that athlete on that day
        noteSection.text = theAthlete?.getWorkout(selectedDate: datePicker.date).notes
        
        milesButton.isEnabled = false
        timeButton.isEnabled = false
        noteSection.isEditable = false
        
        
        
        
    }

    
    override func didReceiveMemoryWarning() {
    
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

