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
    
    @IBOutlet weak var weeklyStatsPU: UIButton!
    
    @IBOutlet weak var totalStatsPU: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        datePicker.datePickerMode = UIDatePickerMode.date
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let strDate = dateFormatter.string(from: datePicker.date)
        self.runDate.text = strDate
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    }
