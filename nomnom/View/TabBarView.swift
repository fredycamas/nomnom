//
//  TabBarVIew.swift
//  nomnom
//
//  Created by Life on 1/31/23.
//

import UIKit

class TabBarView: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTabViews()
    }
    
    private func loadTabViews() {
        let homeController = HomeController()
        let favController = FavController()
        
        self.setViewControllers([homeController, favController], animated: false)
        self.tabBar.backgroundColor = .blue
    }
}
