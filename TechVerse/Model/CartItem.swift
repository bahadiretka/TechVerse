//
//  CartItem.swift
//  TechVerse
//
//  Created by Bahadır Kılınç on 20.07.2022.
//

import Foundation

class CartItem: Identifiable,Codable{
    var product: Product
    var quantity: Int = 1
    init(quantity: Int = 1, product: Product) {
            self.quantity = quantity
            self.product = product
    }
    init(quantity: Int = 1, id: Int){
        self.quantity = quantity
        self.product = products.filter{$0.id == id}.first!
    }
}
