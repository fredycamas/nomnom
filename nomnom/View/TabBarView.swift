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
        
        homeController.tabBarItem.image = UIImage(systemName: "person")
        homeController.title = "Home"
        favController.title = "Favorite"
       

        
        favController.tabBarItem.image = UIImage(systemName: "star")
        favController.tabBarItem.badgeValue = "1"
        
        self.setViewControllers([homeController, favController], animated: false)
        self.tabBar.backgroundColor = .blue
    }
}
