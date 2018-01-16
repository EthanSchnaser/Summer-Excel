//
//  TeamDataView.swift
//  Summer-Excel
//
//  Created by SCHNASER, ETHAN on 12/11/17.
//  Copyright © 2017 DIstrict 196. All rights reserved.
//

import UIKit

class TeamDataView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tView: UITableView!
    var cellReuseIdentifier = "cell"
    var int = 0
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

        if int <= 0
        {
            theTeam = theTeam.sorted(by:({$0.totalMiles > $1.totalMiles}))
            tView?.reloadData()
            int = 1
            print("Total Miles")
            return
        }
        if int > 0 && int < 2
        {
            theTeam = theTeam.sorted(by:({$0.thisGrade < $1.thisGrade}))
            tView?.reloadData()
            int = int + 1
            print("Grade Level")
            return
        }
        if int == 2
        {
            theTeam = theTeam.sorted(by:({$0.totalPace.seconds > $1.totalPace.seconds}))
        }
        else
        {
        theTeam = theTeam.sorted(by:({$0.thisName < $1.thisName}))
            tView?.reloadData()
            int = int + 1
            print("Alphabetical")
            return
        }
    
    }


    }

