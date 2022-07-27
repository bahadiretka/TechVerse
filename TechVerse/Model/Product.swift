//
//  Product.swift
//  TechVerse
//
//  Created by Bahadır Kılınç on 15.07.2022.
//

import Foundation

struct Product: Codable, Identifiable,Hashable {
    let id: Int
    let name: String
    let category: String
    let image: String
    let price: Int
    let description: String
   
    var formattedPrice: String { return "$\(price)" }
    
}
