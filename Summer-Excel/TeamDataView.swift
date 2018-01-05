//
//  TeamDataView.swift
//  Summer-Excel
//
//  Created by SCHNASER, ETHAN on 12/11/17.
//  Copyright © 2017 DIstrict 196. All rights reserved.
//

import UIKit

class TeamDataView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tView: UITableView?
    var cellReuseIdentifier = "cell"
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
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
        var int = 0
        if int <= 0
        {
        theTeam = theTeam.sorted(by:({$0.thisName < $1.thisName}))
        tView?.reloadData()
        print(tView)
        int+=1
        }
        else if int == 1
        {
        theTeam = theTeam.sorted(by:({$0.thisName < $1.thisName}))
        }
    }
    
    }

