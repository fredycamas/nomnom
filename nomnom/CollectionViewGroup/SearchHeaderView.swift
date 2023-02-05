//
//  SearchHeaderView.swift
//  nomnom
//
//  Created by Life on 2/4/23.
//

import UIKit

protocol SearchHeaderDelegate {
    func searchBtnPressed(view: SearchHeaderView)
}

class SearchHeaderView: UICollectionReusableView {
    
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
        
      
        
        addSubview(searchHeaderTextField)
        searchHeaderTextField.translatesAutoresizingMaskIntoConstraints = false
        searchHeaderTextField.topAnchor.constraint(equalTo: subSearchTitleHeader.bottomAnchor,constant: 16).isActive = true
        searchHeaderTextField.leftAnchor.constraint(equalTo: leftAnchor, constant:  24).isActive = true
        searchHeaderTextField.bottomAnchor.constraint(equalTo:bottomAnchor ,constant: 0).isActive = false
        searchHeaderTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        searchHeaderTextField.widthAnchor.constraint(equalToConstant: 0).isActive = true
        searchHeaderTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
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
        textField.setIcon(UIImage(systemName: "magnifyingglass")!, size: 25)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 9, height: textField.frame.height))
        textField.leftViewMode = .always
       
        textField.layer.masksToBounds = true
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.returnKeyType = .next
        
        return textField
        
    }()
    

 
   
}
