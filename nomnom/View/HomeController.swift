//
//  HomeController.swift
//  nomnom
//
//  Created by Life on 1/31/23.
//

import UIKit

class HomeController: UICollectionViewController  {
   
    
    //private var collectionView: UICollectionViewController?
    //private let collectionView = UICollectionViewController
    
    init() {
      
        
       let layout = UICollectionViewFlowLayout()
       // let layout = makeCompositionalLayoutViewControllerWithZoomingCarousel2()

        super.init(collectionViewLayout: layout)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var businessManagment = BusinessManagment()
    var businessCardContainer: [BusinessCardModel] = []
    let CPLatitude: Double = 40.782483
    let CPLongitude: Double = -73.963540
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        businessManagment.delegate = self
        
        businessManagment.fetchData(latitude: CPLatitude, longitude: CPLongitude, category: "restaurants",
                  limit: 20, sortBy: "distance", locale: "en_US") { (response, error) in
            
        }
        collectionView.register(SearchHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SearchHeaderView.id)
                                
        //collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: SearchResultCell.id)
       // collectionView.register(SearchHeaderView.self, forCellWithReuseIdentifier: SearchHeaderView.id)
        collectionView.keyboardDismissMode = .interactive
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 111, right: 0)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
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
        return  businessCardContainer.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCell.id, for: indexPath) as! SearchResultCell
            //cell.delegate = self
        
        
        cell.businessImageView.load(urlString: businessCardContainer[indexPath.row].urlImage)
        cell.nameBusiness.text = businessCardContainer[indexPath.row].name
        cell.priceBusiness.text = businessCardContainer[indexPath.row].price
        cell.rateBusiness.text = String("Rate: \(businessCardContainer[indexPath.row].rating)")
        cell.likeButton.isSelected = true
        return cell

    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("CELL COLLECTIONVIEW\(indexPath)")
      
    }
}

extension HomeController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 330)
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


extension UIImageView {
    func load(urlString: String) {
        if let url = URL(string: urlString) {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        }
    }
}


extension HomeController: BusinessManagmentDelegate{
    func didUpdateBusiness(businessData: [BusinessCardModel]) {
        DispatchQueue.main.async {
            self.businessCardContainer = businessData
            self.collectionView.reloadData()
        }
       
    }


}


extension HomeController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("search keyboard")
        
        return true
    }
}
