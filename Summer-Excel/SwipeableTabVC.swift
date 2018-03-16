//
//  SwipeableTabVC.swift
//  Summer-Excel
//
//  Created by SCHNASER, ETHAN on 3/16/18.
//  Copyright © 2018 DIstrict 196. All rights reserved.
//

import UIKit

class SwipableTabVC : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let left = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        left.direction = .left
        self.view.addGestureRecognizer(left)
        
        let right = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))
        right.direction = .right
        self.view.addGestureRecognizer(right)
    }
    
    @objc func swipeLeft() {
        let total = self.tabBarController!.viewControllers!.count - 1
        tabBarController!.selectedIndex = min(total, tabBarController!.selectedIndex + 1)
        
    }
    
    @objc func swipeRight() {
        tabBarController!.selectedIndex = max(0, tabBarController!.selectedIndex - 1)
    }
}
