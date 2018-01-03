//
//  TeamDataView.swift
//  Summer-Excel
//
//  Created by SCHNASER, ETHAN on 12/11/17.
//  Copyright © 2017 DIstrict 196. All rights reserved.
//

import UIKit

class TeamDataView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return(theTeam.count)
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default , reuseIdentifier: "cell")
        cell.textLabel?.text = theTeam[indexPath.row].thisName
        return(cell)
    }
    @IBAction func showPopUp(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpID") as! SortingPopUpViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }

    func sortAlpha()
    {
        let Ethan = Athlete(name: "Ethan", grade: 12)
        let Max = Athlete(name: "Max", grade: 12)
        let Jake = Athlete(name: "Jake", grade: 12)
        theTeam.append(Ethan)
        theTeam.append(Max)
        theTeam.append(Jake)
        let length = theTeam.count
        var tmpArray: Array = [""]
        for i in stride(from: 0, to: length, by: 1)
        {
            tmpArray[i] = theTeam[i].thisName
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
        for i in stride(from: 0, to: length, by: 1)
        {
        print(theTeam[i].thisName)
        }
        
        
    }
    }

