//
//  AddTeamatePopUp.swift
//  Summer-Excel
//
//  Created by ABBOTT, JACOB on 12/11/17.
//  Copyright © 2017 DIstrict 196. All rights reserved.
//

import UIKit

class AddTeamatePopUp: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Check to make sure they have entered something
    
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var gradeNine: UIButton!
    @IBOutlet weak var gradeTen: UIButton!
    @IBOutlet weak var gradeEleven: UIButton!
    @IBOutlet weak var gradeTwelve: UIButton!
    var alert = UIAlertController()
    
    
    @IBAction func pressNine(_ sender: Any) {
        gradeNine.isSelected = true
        gradeTen.isSelected = false
        gradeEleven.isSelected = false
        gradeTwelve.isSelected = false
    }
    
    @IBAction func pressTen(_ sender: Any) {
        gradeNine.isSelected = false
        gradeTen.isSelected = true
        gradeEleven.isSelected = false
        gradeTwelve.isSelected = false
    }
    
    @IBAction func pressEleven(_ sender: Any) {
        gradeNine.isSelected = false
        gradeTen.isSelected = false
        gradeEleven.isSelected = true
        gradeTwelve.isSelected = false
    }
    
    @IBAction func pressTwelve(_ sender: Any) {
        gradeNine.isSelected = false
        gradeTen.isSelected = false
        gradeEleven.isSelected = false
        gradeTwelve.isSelected = true
    }
    
    
    
    @IBAction func addTeamate(_ sender: Any) {
        let athleteName = firstName.text! + " " + lastName.text!
        var gradeSelected = 0
        
        alert.title = "Please Enter a First and Last Name"
        let dismissAction = UIAlertAction(title: "dismiss", style: UIAlertActionStyle.default, handler: { (dismissAction) in
            self.alert.dismiss(animated: true, completion: nil)
        })
        
        alert.addAction(dismissAction)
        if (firstName.text == "") || (lastName.text == ""){
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        alert.title = "Please Select a Grade"
        if gradeNine.isSelected {
            gradeSelected = 9
        } else if gradeTen.isSelected {
            gradeSelected = 10
        } else if gradeEleven.isSelected {
            gradeSelected = 11
        } else if gradeTwelve.isSelected {
            gradeSelected = 12
        } else {
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        let newAthlete = Athlete(name: athleteName, grade: gradeSelected)
        
        theTeam.append(newAthlete)
        
        dismiss(animated: true, completion: nil)
        
    }
    

}
