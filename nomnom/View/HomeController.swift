//
//  HomeController.swift
//  nomnom
//
//  Created by Life on 1/31/23.
//

import UIKit

class HomeController: UICollectionViewController{
    
    var searchBtnPressed = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        navigationItem.titleView = titleView
        navigationItem.largeTitleDisplayMode = . always
        navigationItem.hidesBackButton = true
        
        
        collectionView.register(EvenHeaderView, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: EventHeaderView.id)
    }
}
