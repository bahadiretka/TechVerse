//
//  CartManager.swift
//  TechVerse
//
//  Created by Bahadır Kılınç on 18.07.2022.
//

import Foundation
import Firebase


class CartManager: ObservableObject {
    @Published private(set) var items = [CartItem]()
    
    var total: Int{
        get{
            var total = 0
            items.forEach { item in
                total += item.product.price * item.quantity
            }
            return total
        }
        set{
            
        }
    }

    let paymentHandler = PaymentHandler()
    @Published var paymentSuccess = false

    func addToCart(product: Product, quantity: Int = 1) {
        let item = items.filter { $0.product.id == product.id }
        if item.first != nil {
            item.first!.quantity += 1
        } else {
            items.append(CartItem(quantity: quantity, product: product))
        }
        self.objectWillChange.send()
    }
    func removeOneQuantity(of product: Product){
        let item = items.filter { $0.product.id == product.id }
        if item.first != nil {
            item.first!.quantity -= 1
        }
        self.objectWillChange.send()
    }
    
    func removeFromCart(product: Product) {
        items = items.filter { $0.product.id != product.id }
    }

    func pay() {
        paymentHandler.startPayment(products: items, total: total) { success in
            let db = Firestore.firestore()

            let formatter = DateFormatter()
            formatter.timeStyle = .medium
            formatter.dateStyle = .medium
            let orders = self.items.map{String("\($0.product.id)>\($0.quantity)>\(formatter.string(from: Date.now))")}.joined(separator: "-")
            db.collection("Users").document(Auth.auth().currentUser?.email ?? "").setData([
                "orders" : orders
            ], merge: true)

            self.paymentSuccess = success
            self.items = []
            self.total = 0
        }
    }
}
