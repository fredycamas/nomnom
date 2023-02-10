//
//  BusinessCardModel.swift
//  nomnom
//
//  Created by Life on 2/9/23.
//

import Foundation

struct BusinessCardModel{
    var id:String
    var name:String
    var rating:Float
    var price:String
    var open:Bool
    var address:[String]
    var urlImage: String
    var longitude:String
    var latitude:String
    
    var addessString: String {
         address.joined(separator: "\n")
    }
}
