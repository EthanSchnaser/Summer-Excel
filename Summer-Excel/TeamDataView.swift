//
//  TeamDataView.swift
//  Summer-Excel
//
//  Created by SCHNASER, ETHAN on 12/11/17.
//  Copyright © 2017 DIstrict 196. All rights reserved.
//

import UIKit
import MessageUI

class TeamDataView: UIViewController, UITableViewDataSource, UITableViewDelegate, MFMailComposeViewControllerDelegate {
    @IBOutlet weak var tView: UITableView!
    var cellReuseIdentifier = "TableViewCell"
    var int = 0
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return(theTeam.count)
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! TableViewCell
        let totMi = String(theTeam[indexPath.row].totalMiles)
        let avePace = theTeam[indexPath.row].averagePace.toString()
        let gra = String(theTeam[indexPath.row].thisGrade)
        cell.name?.text = theTeam[indexPath.row].thisName
        cell.totalMiles?.text = totMi
        cell.averagePace?.text = avePace
        cell.grade?.text = gra
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
            theTeam = theTeam.sorted(by:({$0.thisGrade > $1.thisGrade}))
            tView?.reloadData()
            int = int + 1
            print("Grade Level")
            return
        }
        if int == 2
        {
            theTeam = theTeam.sorted(by:({$0.averagePace.seconds > $1.averagePace.seconds}))
            tView?.reloadData()
            int += 1
            print("Average Pace")
            return
        }
        else
        {
        theTeam = theTeam.sorted(by:({$0.thisName < $1.thisName}))
            tView?.reloadData()
            int = 0
            print("Alphabetical")
            return
        }
    
    }


    @IBAction func exportFile(_ sender: Any) {
        var csvText = "First Name,Last Name,Grade,Total Miles,Average Pace,Total Time,ExcelAttendence\n"
        let fileName = "Runners.csv"
        let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
        if theTeam.count > 0
        {
        for i in stride(from: 0, to: theTeam.count, by: 1) {
            let tmp: Athlete = theTeam[i]
            let first = tmp.thisName.components(separatedBy: " ").first!
            let last = tmp.thisName.components(separatedBy: " ").last!
            let grade = tmp.thisGrade
            let miles = tmp.totalMiles
            let pace = tmp.averagePace
            let time = tmp.totalTime
            let excelAtt = tmp.attendance
            let newLine = "\(first),\(last),\(grade),\(miles),\(pace),\(time),\(excelAtt)\n"
            csvText.append(newLine)
            }
        
            if MFMailComposeViewController.canSendMail() {
                let emailController = MFMailComposeViewController()
                emailController.mailComposeDelegate = self
                emailController.setToRecipients([]) //I usually leave this blank unless it's a "message the developer" type thing
                emailController.setSubject("Here is your fancy email")
                emailController.setMessageBody("Wow, look at this cool email", isHTML: false)
            }
        
            do {
                try csvText.write(to: path!, atomically: true, encoding: String.Encoding.utf8)
                let vc = UIActivityViewController(activityItems: [path!], applicationActivities: [])
                vc.excludedActivityTypes = [
                    UIActivityType.assignToContact,
                    UIActivityType.saveToCameraRoll,
                    UIActivityType.postToFlickr,
                    UIActivityType.postToVimeo,
                    UIActivityType.postToTencentWeibo,
                    UIActivityType.postToTwitter,
                    UIActivityType.postToFacebook,
                    UIActivityType.openInIBooks
                ]
                present(vc, animated: true, completion: nil)
            } catch {
                print("Failed to create file")
                print("\(error)")
                
            }
        }
        else{
            print("Error")
        }
        }
    }


