//
//  ExpandFeature.swift
//  nomnom
//
//  Created by Life on 2/17/23.
//

import UIKit

class ExpandFeatureController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(contentTextView)
        
        contentTextView.translatesAutoresizingMaskIntoConstraints = false
        contentTextView.topAnchor.constraint(equalTo: view.topAnchor,constant: 32).isActive = true
        contentTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant:  24).isActive = true
        contentTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor ,constant: 0).isActive = false
        contentTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        contentTextView.widthAnchor.constraint(equalToConstant: 0).isActive = true
        contentTextView.heightAnchor.constraint(equalToConstant: 31).isActive = true
     
        
    }
    
    lazy var contentTextView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .red
        view.addSubview(pictureImage)
    

        return view
        
    }()
    let pictureImage: UIImageView = {
        
        let image = UIImageView()
        image.image = UIImage(named: "person")
        image.clipsToBounds = true
        image.clipsToBounds = true
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
    

}


