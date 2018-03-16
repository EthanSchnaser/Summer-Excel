//
//  TotalStatsPopUpViewController.swift
//  Summer-Excel
//
//  Created by ABBOTT, JACOB on 3/1/18.
//  Copyright © 2018 DIstrict 196. All rights reserved.
//

import UIKit

class TotalStatsPopUpViewController: UIViewController {
    @IBOutlet weak var totalMilesLabel: UILabel!
    @IBOutlet weak var totalRunTimeLabel: UILabel!
    @IBOutlet weak var averagePaceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let miles = theAthlete?.totalMiles
        let milesStr = "\(miles ?? 0)"
        totalMilesLabel.text = milesStr
        
        let runTime = theAthlete?.totalTime
        let runTimeStr = runTime?.toString()
        totalRunTimeLabel.text = runTimeStr
        
        let avgPace = theAthlete?.averagePace
        let avgPaceStr = avgPace?.toString()
        averagePaceLabel.text = ( avgPaceStr! + " mph" )
        
        
        
        
        
        
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
