//
//  WeeklyStatsPUViewController.swift
//  Summer-Excel
//
//  Created by ABBOTT, JACOB on 3/2/18.
//  Copyright © 2018 DIstrict 196. All rights reserved.
//

import UIKit

class WeeklyStatsPUViewController: UIViewController {

    
    @IBOutlet weak var milesLabel: UILabel!
    @IBOutlet weak var runTimeLabel: UILabel!
    @IBOutlet weak var daysAttendedLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let today =  Date()
        
        let weeklyStats = theAthlete?.weeklyTotals(day: today)
        let miles = weeklyStats?.0
        let runTime = weeklyStats?.1
        let attendance = weeklyStats?.2
        
        milesLabel.text = "\(miles ?? 0)"
        runTimeLabel.text = runTime?.toString()
        daysAttendedLabel.text = "\(attendance ?? 0)"
        
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

}
