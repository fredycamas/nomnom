//
//  ExtensionTextFiledForIcon.swift
//  nomnom
//
//  Created by Life on 2/4/23.
//

import UIKit

extension UITextField {
    func setIcon(_ image: UIImage,size: Int) {
        
        let padding = 8
        
        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size+padding, height: size) )
        
        let iconView  = UIImageView(frame: CGRect(x: -padding, y: 0, width: size, height: size))
        
        iconView.image = image
        iconView.tintColor = .red
        outerView.addSubview(iconView)
        
        rightView = outerView
        rightViewMode = .always
    }
}
