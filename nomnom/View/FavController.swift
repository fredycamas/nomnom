//
//  FavController.swift
//  nomnom
//
//  Created by Life on 1/31/23.
//

import UIKit

class FavController: UICollectionViewController{
    
    init() {
       let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarItem.badgeValue = "2"
    }
}
