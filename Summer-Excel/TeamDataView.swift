//
//  TeamDataView.swift
//  Summer-Excel
//
//  Created by SCHNASER, ETHAN on 12/11/17.
//  Copyright © 2017 DIstrict 196. All rights reserved.
//

import UIKit

class TeamDataView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return(theTeam.count)
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        cell.textLabel?.text = theTeam[indexPath.row].thisName
        tView = tableView
        return(cell)
    }
    
    @IBAction func showPopUp(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpID") as! SortingPopUpViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }

    }

