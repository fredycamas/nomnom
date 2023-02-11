//
//  EventCell.swift
//  nomnom
//
//  Created by Life on 2/6/23.
//

import UIKit



class SearchResultCell: UICollectionViewCell {
    
    static let id = "ResultEventCell"
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
       
        addSubview(contentTextView)
        
        contentTextView.translatesAutoresizingMaskIntoConstraints = false
        contentTextView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 32).isActive = true
        contentTextView.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 32).isActive = true
        contentTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -9).isActive = false
        contentTextView.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -32).isActive = false
        contentTextView.widthAnchor.constraint(equalToConstant: (frame.width - 62)).isActive = true
        contentTextView.heightAnchor.constraint(equalToConstant: 200).isActive =  true
        
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var contentTextView: UIView = {
        
        let view = UIView()
        view.layer.borderWidth = 0.6
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 15
        view.backgroundColor = .white
        
        view.addSubview(businessImageView)
        businessImageView.translatesAutoresizingMaskIntoConstraints = false
        businessImageView.topAnchor.constraint(equalTo: view.topAnchor,constant: 0).isActive = true
        businessImageView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 0).isActive = true
        businessImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0).isActive = false
        businessImageView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: 0).isActive = false
        businessImageView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        businessImageView.heightAnchor.constraint(equalToConstant: 100).isActive =  true
        
    

        view.addSubview(titleLabel1)
        titleLabel1.translatesAutoresizingMaskIntoConstraints = false
        titleLabel1.topAnchor.constraint(equalTo: businessImageView.bottomAnchor,constant: 16).isActive = true
        titleLabel1.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16).isActive = true
        titleLabel1.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0).isActive = false
        titleLabel1.rightAnchor.constraint(equalTo: view.rightAnchor,constant: 0).isActive = true
        titleLabel1.widthAnchor.constraint(equalToConstant: 0).isActive = true
        titleLabel1.heightAnchor.constraint(equalToConstant: 21).isActive = true

        
        return view
        
    }()
    let businessImageView: UIImageView = {
        
        let image = UIImageView()
        image.image = UIImage(systemName: "person")
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
        
    }()
    let titleLabel1: UILabel = {
        let label = UILabel()
        label.text = "result Title "
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
}
