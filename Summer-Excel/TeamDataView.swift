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
    
    

    @IBAction func sort(_ sender: Any) {
        while theTeam.count > 0
        {
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
        return
    
    }


    
    @IBAction func exportCsvFile(_ sender: Any) {
        var csvText: [String] = ["First Name,Last Name,Grade,Total Miles,Average Pace,Total Time,ExcelAttendence\n"]
        let fileName = "Runners.csv"
        let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
        if theTeam.count > 0
        {
        for i in stride(from: 0, to: theTeam.count, by: 1)
        {
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
            let inputString = csvText.joined(separator: ",")
            let data = inputString.data(using: String.Encoding.utf8, allowLossyConversion: false)
            if let content = data{
                print("NSData: \(content)")
            }
            
            //Generating email controller
            func createEmailViewController() -> MFMailComposeViewController
            {
                let emailController = MFMailComposeViewController()
                emailController.mailComposeDelegate = self
                emailController.setSubject("Runner Data:")
                emailController.setMessageBody("CSV file of Runner's total miles, average pace, total time, and grade level", isHTML: false)
                emailController.setToRecipients(["shannon.braun@district196.org"])
                
                //Add csv file to the controller
                emailController.addAttachmentData(data!, mimeType: "text/csv", fileName: fileName)
                
                return emailController
                
            }
            
            func showSendMailErrorAlert()
            {
                let sendMailErrorAlert = UIAlertController(title: "Could not send Email", message: "Your device could not send email. Please check your email configureation and try again", preferredStyle: UIAlertControllerStyle.alert)
                let OKAction = UIAlertAction(title: "OK", style: .default) {action in}
                
                sendMailErrorAlert.addAction(OKAction)
                sendMailErrorAlert.present(sendMailErrorAlert, animated: true, completion: nil)
            }

            //The following code will allow the user to enter the subject, body text, and the email recipient to send the already attached CSV file
            let emailViewController = createEmailViewController()
            if MFMailComposeViewController.canSendMail()
            {
                self.present(emailViewController, animated: true, completion: nil)
            }
            else
            {
                showSendMailErrorAlert()
            }

            
            
                    }
        
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?)
        {
            controller.dismiss(animated: true, completion: nil)
        }

    }
}


