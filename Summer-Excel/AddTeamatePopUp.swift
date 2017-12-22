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
    
    @IBAction func pressNine(_ sender: Any) {
        
        
    }
    
    @IBAction func pressTen(_ sender: Any) {
    }
    
    @IBAction func pressEleven(_ sender: Any) {
    }
    
    @IBAction func pressTwelve(_ sender: Any) {
    }
    
    
    @IBAction func addTeamate(_ sender: Any) {
        let athleteName = firstName.text! + " " + lastName.text!
        
        let newAthlete = Athlete(name: athleteName, grade: 10)
        
        theTeam.append(newAthlete)
        
        print(theTeam[0].thisName)
        
        
        
    }

}
