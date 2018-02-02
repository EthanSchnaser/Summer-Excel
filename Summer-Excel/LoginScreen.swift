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
    @IBOutlet weak var loginButton: UIButton!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        loginEnabled()
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return theTeam[row].thisName
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return theTeam.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func loginPressed(_ sender: Any) {
        let x = athletePickerView.selectedRow(inComponent: 0)
        theAthlete = theTeam[x]
    }
    
    func loginEnabled() {
        if theTeam.count < 1 {
            loginButton.isEnabled = false
        } else {
            loginButton.isEnabled = true
        }
    }
    
}


