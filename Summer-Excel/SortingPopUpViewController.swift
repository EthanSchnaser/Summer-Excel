//
//  SortingPopUpViewController.swift
//  Summer-Excel
//
//  Created by SCHNASER, ETHAN on 1/2/18.
//  Copyright © 2018 DIstrict 196. All rights reserved.
//

import UIKit

class SortingPopUpViewController: TeamDataView {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func closePopUp3(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    @IBAction func closePopUp2(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    @IBAction func closePopUp(_ sender: Any) {

        theTeam = theTeam.sorted(by: ({$0.thisName < $1.thisName}))
        super.reload()
        self.view.removeFromSuperview()
    }
}
