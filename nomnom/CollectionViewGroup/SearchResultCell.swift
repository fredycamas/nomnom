//
//  EventCell.swift
//  nomnom
//
//  Created by Life on 2/6/23.
//

import UIKit



class SearchResultCell: UICollectionViewCell {
    
    static let id = "ResultEventCell"
    
    let likeButton = UIButton(type: .custom)
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
       
        addSubview(contentTextView)
        
        contentTextView.translatesAutoresizingMaskIntoConstraints = false
        contentTextView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8).isActive = true
        contentTextView.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 16).isActive = true
        contentTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -8).isActive = false
        contentTextView.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -16).isActive = false
        contentTextView.widthAnchor.constraint(equalToConstant: (frame.width - 32)).isActive = true
        contentTextView.heightAnchor.constraint(equalToConstant: 240).isActive =  true
//
//        likeButton.setImage(UIImage(named: "like"), for: .normal)
//        likeButton.setImage(UIImage(named: "liked"), for: .selected)
        
        
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.setImage(UIImage(systemName: "heart_fill"), for: .selected)
        likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        contentView.addSubview(likeButton)
        
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.topAnchor.constraint(equalTo: businessImageView.bottomAnchor,constant: 8).isActive = true
        likeButton.leftAnchor.constraint(equalTo: nameBusiness.leftAnchor).isActive = true
        likeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: 0).isActive = false
        likeButton.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -32).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        

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
        businessImageView.widthAnchor.constraint(equalToConstant: (frame.width-32) ).isActive = true
        businessImageView.heightAnchor.constraint(equalToConstant: 150).isActive =  true
        
    

        view.addSubview(nameBusiness)
        nameBusiness.translatesAutoresizingMaskIntoConstraints = false
        nameBusiness.topAnchor.constraint(equalTo: businessImageView.bottomAnchor,constant: 8).isActive = true
        nameBusiness.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16).isActive = true
        nameBusiness.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0).isActive = false
        nameBusiness.rightAnchor.constraint(equalTo: view.rightAnchor,constant: 0).isActive = true
        nameBusiness.widthAnchor.constraint(equalToConstant: 0).isActive = true
        nameBusiness.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
     
        view.addSubview(priceBusiness)
        priceBusiness.translatesAutoresizingMaskIntoConstraints = false
        priceBusiness.topAnchor.constraint(equalTo: nameBusiness.bottomAnchor,constant: 8).isActive = true
        priceBusiness.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16).isActive = true
        priceBusiness.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0).isActive = false
        priceBusiness.rightAnchor.constraint(equalTo: view.rightAnchor,constant: 0).isActive = true
        priceBusiness.widthAnchor.constraint(equalToConstant: 0).isActive = true
        priceBusiness.heightAnchor.constraint(equalToConstant: 20).isActive = true
       
        view.addSubview(rateBusiness)
        rateBusiness.translatesAutoresizingMaskIntoConstraints = false
        rateBusiness.topAnchor.constraint(equalTo: priceBusiness.bottomAnchor,constant: 8).isActive = true
        rateBusiness.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16).isActive = true
        rateBusiness.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0).isActive = false
        rateBusiness.rightAnchor.constraint(equalTo: view.rightAnchor,constant: 0).isActive = true
        rateBusiness.widthAnchor.constraint(equalToConstant: 0).isActive = true
        rateBusiness.heightAnchor.constraint(equalToConstant: 20).isActive = true


        
        return view
        
    }()
    let businessImageView: UIImageView = {
        
        let image = UIImageView()
        image.image = UIImage(systemName: "")
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        return image
        
    }()
    
    
    let nameBusiness: UILabel = {
        let label = UILabel()
        label.text = "coming soon..."
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    let addressBusiness: UILabel = {
        let label = UILabel()
        label.text = "coming soon..."
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    let priceBusiness: UILabel = {
        let label = UILabel()
        label.text = "coming soon..."
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    let rateBusiness: UILabel = {
        let label = UILabel()
        label.text = "coming soon..."
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
//    @objc func likeButtonTapped() {
//        print("like")
//      }
    
    @objc func likeButtonTapped() {
        print("like select4ed")
           likeButton.isSelected.toggle()
       }
}
