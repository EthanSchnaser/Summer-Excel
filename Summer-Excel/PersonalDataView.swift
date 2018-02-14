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
    
    @IBOutlet weak var weeklyStatsPU: UIButton!
    
    @IBOutlet weak var totalStatsPU: UIButton!
    
    @IBAction func changeDate(_ sender: AnyObject) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let strDate = dateFormatter.string(from: self.datePicker.date)
        self.runDate.text = strDate
        //everytime the date is changed in the datePicker, the label changes with it.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        datePicker.datePickerMode = UIDatePickerMode.date
        //sets the display of the datePicker to mm dd yyyy
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let strDate = dateFormatter.string(from: self.datePicker.date)
        self.runDate.text = strDate
        //sets the inital display date to the date datePicker is set to (Today)
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    }
