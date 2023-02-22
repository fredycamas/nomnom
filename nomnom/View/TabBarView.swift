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
        
        //let navController = UINavigationController(rootViewController: myCollectionVC)
        //self.present(navController, animated: true, completion: nil)
        
        homeController.tabBarItem.image = UIImage(systemName: "person")
        homeController.title = "Home"
        let navController = UINavigationController(rootViewController: homeController)
        favController.title = "Favorite"
       

        
        favController.tabBarItem.image = UIImage(systemName: "star")
        favController.tabBarItem.badgeValue = "1"
        
        
        
        self.setViewControllers([navController, favController], animated: false)
        self.tabBar.backgroundColor = .blue
    }
}
