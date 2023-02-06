//
//  HomeController.swift
//  nomnom
//
//  Created by Life on 1/31/23.
//

import UIKit

class HomeController: UICollectionViewController  {
   
    
    init() {
      
       let layout = UICollectionViewFlowLayout()
       // let layout = makeCompositionalLayoutViewControllerWithZoomingCarousel2()
        
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(SearchHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SearchHeaderView.id)
                                
                                
        //collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.register(ResultEvent.self, forCellWithReuseIdentifier: ResultEvent.id)
        collectionView.keyboardDismissMode = .interactive
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 111, right: 0)
        
    }
    
}

extension HomeController: SearchHeaderDelegate {
    func searchBtnPressed(view: SearchHeaderView) {
        print("searchTapped")
    }
    
}
//MARK: - UICollectionViewDataSource and UICollectionViewDelegate
/*HomeController class already conforms to the UICollectionViewDataSource and UICollectionViewDelegate protocols as a subclass of UICollectionViewController. Adding the conformance in an extension is redundant and unnecessary as the class already conforms to the protocols through inheritance
 */
extension HomeController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ResultEvent.id, for: indexPath) as! ResultEvent
            //cell.delegate = self
        return cell

    }
}

extension HomeController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header =
            collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SearchHeaderView.id, for: indexPath) as! SearchHeaderView
        header.delegate = self
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
   
            return CGSize(width: (view.frame.width), height: (view.frame.height/2) - 210)
      
    }
}



func makeCompositionalLayoutViewControllerWithZoomingCarousel2() -> UICollectionViewCompositionalLayout {
        let compositionalLayout: UICollectionViewCompositionalLayout = {
            let fraction: CGFloat = 1.0 / 3.0
            
            // Item
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // Group
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction), heightDimension: .fractionalWidth(fraction))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            // Section
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 500, leading: 2.5, bottom: 0, trailing: 2.5)
            section.orthogonalScrollingBehavior = .continuous
            section.visibleItemsInvalidationHandler = { (items, offset, environment) in
                items.forEach { item in
                    let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
                    let minScale: CGFloat = 0.7
                    let maxScale: CGFloat = 0.7
                    let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
                    item.transform = CGAffineTransform(scaleX: scale, y: scale)
                }
            }
            
            return UICollectionViewCompositionalLayout(section: section)
        }()
        return compositionalLayout
    }
