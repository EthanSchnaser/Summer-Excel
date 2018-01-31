//
//  LoginScreen.swift
//  Summer-Excel
//
//  Created by SCHNASER, ETHAN; MARSHALL, MAX; and ABBOTT, JAKE on 12/7/17.
//  Copyright © 2017 DIstrict 196. All rights reserved.
//

import UIKit



class LoginScreen: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    @IBOutlet weak var athletePickerView: UIPickerView!
    @IBOutlet weak var excelLogHeader: UILabel!
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return theTeam[row].thisName
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return theTeam.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        excelLogHeader.text = theTeam[row].thisName
    }
    
    func addAthlete(addingAthlete: Athlete) {
        theTeam.append(addingAthlete)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}


