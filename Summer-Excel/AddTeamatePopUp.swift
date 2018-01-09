//
//  AddTeamatePopUp.swift
//  Summer-Excel
//
//  Created by ABBOTT, JACOB on 12/11/17.
//  Copyright © 2017 DIstrict 196. All rights reserved.
//

import UIKit

class AddTeamatePopUp: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.firstTextField.delegate = self
        self.secondTextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Hide Keyboard when user touches outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Presses return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        firstTextField.resignFirstResponder()
        secondTextField.resignFirstResponder()
        return true
    }

    //Check to make sure they have entered something
    
    
    @IBOutlet weak var addTeammate: UIButton!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var gradeNine: UIButton!
    @IBOutlet weak var gradeTen: UIButton!
    @IBOutlet weak var gradeEleven: UIButton!
    @IBOutlet weak var gradeTwelve: UIButton!
    
    @IBAction func editFirst(_ sender: Any) {
        enabled()
    }
    
    @IBAction func editLast(_ sender: Any) {
        enabled()
    }
    
    @IBAction func pressNine(_ sender: Any) {
        gradeNine.isSelected = true
        gradeTen.isSelected = false
        gradeEleven.isSelected = false
        gradeTwelve.isSelected = false
        enabled()
    }
    
    @IBAction func pressTen(_ sender: Any) {
        gradeNine.isSelected = false
        gradeTen.isSelected = true
        gradeEleven.isSelected = false
        gradeTwelve.isSelected = false
        enabled()
    }
    
    @IBAction func pressEleven(_ sender: Any) {
        gradeNine.isSelected = false
        gradeTen.isSelected = false
        gradeEleven.isSelected = true
        gradeTwelve.isSelected = false
        enabled()
    }
    
    @IBAction func pressTwelve(_ sender: Any) {
        gradeNine.isSelected = false
        gradeTen.isSelected = false
        gradeEleven.isSelected = false
        gradeTwelve.isSelected = true
        enabled()
    }
    
    
    
    @IBAction func addTeammate(_ sender: Any) {
        firstName.text?.prefix(1).capitalized
        let athleteName = firstName.text! + " " + lastName.text!
        var gradeSelected = 0
        
        
        if gradeNine.isSelected {
            gradeSelected = 9
        } else if gradeTen.isSelected {
            gradeSelected = 10
        } else if gradeEleven.isSelected {
            gradeSelected = 11
        } else if gradeTwelve.isSelected {
            gradeSelected = 12
        }
        
        let newAthlete = Athlete(name: athleteName, grade: gradeSelected)
        
        theTeam.append(newAthlete)
        
        
        if theTeam.count > 2
        {
         theTeam = theTeam.sorted(by:({$0.thisName < $1.thisName}))
        }
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    func enabled() {
        if (gradeNine.isSelected || gradeTen.isSelected || gradeEleven.isSelected || gradeTwelve.isSelected) && firstName.hasText && lastName.hasText {
            addTeammate.isEnabled = true
        }
    }

}
