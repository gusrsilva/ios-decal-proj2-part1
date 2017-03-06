//
//  tabBarController.swift
//  snapChatProject
//
//  Created by Akilesh Bapu on 2/28/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Main bar color
        self.tabBar.barTintColor = UIColor.white
        
        // Selected Item Color
        self.tabBar.tintColor = UIColor.init(red: 43/255.0, green: 198/255.0, blue: 165/255.0, alpha: 1.0)
        
        // Unselected Item Color
        self.tabBar.unselectedItemTintColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.2)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
