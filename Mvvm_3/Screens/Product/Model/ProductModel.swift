//
//  Product.swift
//  Mvvm_3
//
//  Created by Adarsh Singh on 07/09/23.
//

import Foundation

struct ProductModel: Codable{
    
    var title: String
    var price: Double
    var description: String
    var category: String
    var image: String
    var rating:Rate
}

struct Rate:Codable{
    
    var rate:Double
    var count: Int
}
