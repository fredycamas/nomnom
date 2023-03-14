//
//  HomeController.swift
//  nomnom
//
//  Created by Life on 1/31/23.
//

import UIKit
import CoreLocation



class HomeController: UICollectionViewController {
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var isSearchBarVisible = false
    
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var businessManagment = BusinessManagment()
    var cardContainerOnDisplay: [BusinessCardModel] = []
    var cardContainer: [BusinessCardModel] = []
    var searchText:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItems = createLeftBarButtonItems()
        
        businessManagment.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        //    }
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.id)
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: SearchResultCell.id)
        collectionView.keyboardDismissMode = .interactive
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 111, right: 0)
        
        collectionView.collectionViewLayout = createLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    func createLeftBarButtonItems() -> [UIBarButtonItem] {
        let searchItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchButtonTappedItem))
        let locationItem = UIBarButtonItem(image: UIImage(systemName: "location"), style: .plain, target: self, action: #selector(locationButtonTapped))
        let profileItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(profileButtonTapped))
        
        return [searchItem, locationItem, profileItem]
    }
    
    @objc private func deviceOrientationDidChange() {
        // Update the layout when the device orientation changes
        let layout = makeCompositionalLayoutViewControllerWithZoomingCarousel()
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    @objc private func locationButtonTapped() {
        // Handle location button tap
    }
    
    @objc private func profileButtonTapped() {
        // Handle profile button tap
    }
}


extension HomeController: UISearchBarDelegate,UISearchResultsUpdating  {
    
    func txtFile(item: String) {
        searchText = item
        collectionView.reloadData()    }
    
    func searchBtnPressed(view: HeaderView) {
        print("searchTapped")
    }
    
    @objc private func searchButtonTappedItem() {
        isSearchBarVisible = !isSearchBarVisible
        collectionView.collectionViewLayout.invalidateLayout()
        
        if isSearchBarVisible {
            let searchController = UISearchController(searchResultsController: nil)
            searchController.searchResultsUpdater = self
            searchController.searchBar.delegate = self
            searchController.searchBar.placeholder = "Search"
            searchController.searchBar.showsCancelButton = false
            searchController.obscuresBackgroundDuringPresentation = false
            searchController.hidesNavigationBarDuringPresentation = false
            searchController.searchBar.barTintColor = .red // Set the background color to red
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false // Ensure that the search bar is always visible
        } else {
            navigationItem.searchController = nil
            navigationItem.hidesSearchBarWhenScrolling = true // Restore the default behavior
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let searchFields: [KeyPath<BusinessCardModel, String>] = [\BusinessCardModel.name]
        
        if searchText.isEmpty {
            cardContainerOnDisplay = cardContainer.sorted { $0.name < $1.name }
            return
        }
        
        let searchTerms = searchText.lowercased().split(separator: " ")
        cardContainerOnDisplay = cardContainer.filter { card in
            for field in searchFields {
                let value = card[keyPath: field].lowercased()
                for term in searchTerms {
                    if !value.contains(term) {
                        return false
                    }
                }
            }
            return true
        }
        .sorted { $0.name < $1.name }
        
        
        collectionView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // Handle the search button press
        // You can perform a search operation based on the search text and update the collection view
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // Handle the cancel button press
        // You can clear the search text and reset the collection view to the original data source
    }
    
    
    
    func updateSearchResults(for searchController: UISearchController) {
        print("searc Pressed")
    }
    
}
//MARK: - UICollectionViewDataSource and UICollectionViewDelegate
/*HomeController class already conforms to the UICollectionViewDataSource and UICollectionViewDelegate protocols as a subclass of UICollectionViewController. Adding the conformance in an extension is redundant and unnecessary as the class already conforms to the protocols through inheritance
 */
extension HomeController {
    
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            
            // Header
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(110))
            let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            
            // Item
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // Group
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(500))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)
            group.interItemSpacing = .fixed(10)
            group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            
            // Section
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = [headerItem]
            section.interGroupSpacing = 10
            
            return section
        }
        
        return layout
    }
 
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  cardContainerOnDisplay.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCell.id, for: indexPath) as! SearchResultCell
        
        //cell.delegate = self
        
        
        cell.businessImageView.load(urlString: cardContainerOnDisplay[indexPath.row].urlImage)
        cell.nameBusiness.text = cardContainerOnDisplay[indexPath.row].name
        cell.priceBusiness.text = cardContainerOnDisplay[indexPath.row].price
        cell.rateBusiness.text = String("Rate: \(cardContainerOnDisplay[indexPath.row].rating)")
        cell.likeButton.isSelected = true
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("We are here \(indexPath)")
        let expandedVC = ExpandFeatureController()
        
        navigationController?.pushViewController(expandedVC, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.id, for: indexPath) as! HeaderView
        
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
            self.cardContainerOnDisplay = businessData.sorted { $0.name < $1.name }
            self.cardContainer = businessData
            self.collectionView.reloadData()
        }
        
    }
    
    
}


extension HomeController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("search keyboard \(textField.text)")
        
        return true
    }
}

//MARK: CLLocationManagerDelegate
extension HomeController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        currentLocation = location
        
        let category = "restaurants"
        let limit = 20
        let locale = "en_US"
        
        businessManagment.fetchData(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude, category: category, limit: limit, sortBy: "distance", locale: locale) { (response, error) in
            // Handle the API response
        }
        locationManager.stopUpdatingLocation()
    }
}
