//
//  SortingPopUpViewController.swift
//  Summer-Excel
//
//  Created by SCHNASER, ETHAN on 1/2/18.
//  Copyright © 2018 DIstrict 196. All rights reserved.
//

import UIKit

class SortingPopUpViewController: UIViewController {

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
        self.view.removeFromSuperview()
        let length = theTeam.count
        var tmpArray: Array = [""]
        for i in stride(from: 0, to: length, by: 1)
        {
            tmpArray.append(theTeam[i].thisName)
        }
        tmpArray.sort()
        for i in stride(from: 0, to: length, by: 1)
        {
            let store = theTeam[i].thisName
            for i in stride(from: 0, to: length, by: 1)
            {
                if (store == tmpArray[i])
                {
                    let use = theTeam.remove(at: i)
                    theTeam.insert(use, at:0)
                }
            }
        }
        TeamDataView.tableView.reloadData()
    }
}
