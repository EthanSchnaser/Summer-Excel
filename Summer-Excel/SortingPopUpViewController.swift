//
//  SortingPopUpViewController.swift
//  Summer-Excel
//
//  Created by SCHNASER, ETHAN on 1/2/18.
//  Copyright © 2018 DIstrict 196. All rights reserved.
//

import UIKit
var tableViewNum = 0
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
        self.view.removeFromSuperview()
        var tmpArray: Array = [""]
        for i in stride(from: 0, to: theTeam.count, by: 1)
        {
            tmpArray.append(theTeam[i].thisName)
        }
        tmpArray.sort()
        for i in stride(from: 0, to: theTeam.count, by: 1)
        {
            let store = tmpArray[i]
            for j in stride(from: 0, to: theTeam.count, by: 1)
            {
                if (store == theTeam[j].thisName)
                {
                    let use = theTeam.remove(at: j)
                    theTeam.insert(use, at:i)
                }
            }
        }
        for i in stride(from: 0, to: tmpArray.count, by: 1)
        {
            print(tmpArray[i])
        }
        super.tableView.reloadData()
    }
}
