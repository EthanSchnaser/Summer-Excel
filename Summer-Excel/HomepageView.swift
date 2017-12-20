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
    
    @IBAction func pressEnter(_ sender: Any) {
        let theseMiles = Int(mileInput.text!)
        let theseMinutes = Int(minuteInput.text!)
        let theseNotes = notesInput.text
        let attend = attendanceInput.isOn
        
        
    }
    
    }
