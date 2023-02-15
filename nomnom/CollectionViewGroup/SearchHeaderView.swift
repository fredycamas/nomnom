//
//  SearchHeaderView.swift
//  nomnom
//
//  Created by Life on 2/4/23.
//

import UIKit

protocol SearchHeaderDelegate {
    func searchBtnPressed(view: SearchHeaderView)
    
    func txtFile(item:String)
}

class SearchHeaderView: UICollectionReusableView, UICollectionViewDelegate, UITextFieldDelegate {
    
    static let id = "searchHeaderView"
    
   
    var delegate: SearchHeaderDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addCustomConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCustomConstraints() {
            
      //  contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(searchTitleHeader)
        
        searchTitleHeader.translatesAutoresizingMaskIntoConstraints = false
        searchTitleHeader.topAnchor.constraint(equalTo: topAnchor,constant: 32).isActive = true
        searchTitleHeader.leftAnchor.constraint(equalTo: leftAnchor, constant:  24).isActive = true
        searchTitleHeader.bottomAnchor.constraint(equalTo:bottomAnchor ,constant: 0).isActive = false
        searchTitleHeader.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        searchTitleHeader.widthAnchor.constraint(equalToConstant: 0).isActive = true
        searchTitleHeader.heightAnchor.constraint(equalToConstant: 31).isActive = true
        
        
        addSubview(subSearchTitleHeader)
        subSearchTitleHeader.translatesAutoresizingMaskIntoConstraints = false
        subSearchTitleHeader.topAnchor.constraint(equalTo: searchTitleHeader.bottomAnchor,constant: 8).isActive = true
        subSearchTitleHeader.leftAnchor.constraint(equalTo: leftAnchor, constant:  24).isActive = true
        subSearchTitleHeader.bottomAnchor.constraint(equalTo:bottomAnchor ,constant: 0).isActive = false
        subSearchTitleHeader.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        subSearchTitleHeader.widthAnchor.constraint(equalToConstant: 0).isActive = true
        subSearchTitleHeader.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
      
        searchHeaderTextField.delegate = self
        
        addSubview(searchHeaderTextField)
        
        searchHeaderTextField.translatesAutoresizingMaskIntoConstraints = false
        searchHeaderTextField.topAnchor.constraint(equalTo: subSearchTitleHeader.bottomAnchor,constant: 16).isActive = true
        searchHeaderTextField.leftAnchor.constraint(equalTo: leftAnchor, constant:  24).isActive = true
        searchHeaderTextField.bottomAnchor.constraint(equalTo:bottomAnchor ,constant: 0).isActive = false
        searchHeaderTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        searchHeaderTextField.widthAnchor.constraint(equalToConstant: 0).isActive = true
        searchHeaderTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
       
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(textFieldTapped(tapGestureRecognizer:)))
        
        searchHeaderTextField.rightView?.isUserInteractionEnabled = true
        searchHeaderTextField.rightView?.addGestureRecognizer(tapGestureRecognizer)
        
        
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: searchHeaderTextField.bottomAnchor,constant: 8).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant:  24).isActive = true
        collectionView.bottomAnchor.constraint(equalTo:bottomAnchor ,constant: 0).isActive = false
        collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        collectionView.widthAnchor.constraint(equalToConstant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell1")
        

        
    }

    
    var searchTitleHeader: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.text = "Search for restaurants near by "
       // label.textAlignment = .center
        return label
    }()
    let subSearchTitleHeader: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.text = "undecide which restaurant to pick? \nlet's us pick one for you!"
        label.numberOfLines = 2
        return label
    }()

   lazy var searchHeaderTextField: UITextField = {
        
        let textField = UITextField()
       // textField.backgroundColor = .orange
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Search"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .black
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 40/2
        textField.addAssesory(UIImage(systemName: "magnifyingglass")!, size: 25, withColor: .red)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 9, height: textField.frame.height))
        textField.leftViewMode = .always
       
        textField.layer.masksToBounds = true
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.returnKeyType = .search
        
        return textField
        
    }()
    
lazy var collectionView: UICollectionView = {
    let viewLayout = makeCompositionalLayoutViewControllerWithZoomingCarousel()
    //let viewLayout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
    
    collectionView.backgroundColor = .white
    return collectionView
}()
    
    @objc func textFieldTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        print("hello textfield tapped")
        
    }
    
    
  

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        print("\(textField.text)")
        
        if let newtext = textField.text {
            delegate?.txtFile(item: newtext)
        }
        return true
    }
 
   
}


extension SearchHeaderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell1", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("HORIZONTAL View\(indexPath)")
    }
    

}


//struct CompositionalLayout {
    
func makeCompositionalLayoutViewControllerWithZoomingCarousel() -> UICollectionViewCompositionalLayout {
        let compositionalLayout: UICollectionViewCompositionalLayout = {
            let fraction: CGFloat = 1.0 / 4.0
            
            // Item
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // Group
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction), heightDimension: .fractionalWidth(fraction))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            // Section
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 2.5, bottom: 0, trailing: 2.5)
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
//}


