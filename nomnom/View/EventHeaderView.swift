//
//  EventHeaderView.swift
//  nomnom
//
//  Created by Life on 1/31/23.
//

import UIKit
class EventHeaderView: UICollectionReusableView{
    static let id = "eventHeaderView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
        
    }
    
    //MARK: - Labels, Bottons, TextFields...
    
    var searchLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.text = "Search for Local Restaurants"
        return label
    }()
    
    var subSearchLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.text = "Undecide which one to pick\nLets us pick for you!"
        label.numberOfLines = 2
        
        return label
    }()
    
    var searchTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Search"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .black
        textField.layer.borderWidth = 0.5
        textField.leftView = UIView(frame: CGRect(x:0, y:0, width: 9, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.layer.masksToBounds = true
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.returnKeyType = .search
        
        return textField
    }()
    
    
}
