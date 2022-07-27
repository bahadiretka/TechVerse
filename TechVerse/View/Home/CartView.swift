//
//  CartView.swift
//  TechVerse
//
//  Created by Bahadır Kılınç on 15.07.2022.
//


import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        
        if cartManager.items.count > 0{
            ScrollView {
                if cartManager.paymentSuccess {
                    Text("Thanks for your purchase! You'll also receive an email confirmation shortly.")
                        .padding()
                } else {
                    
                    ForEach(cartManager.items, id: \.product.id) { item in
                        ProductRow(item: item)
                    }
                    HStack {
                        Text("Your cart total is")
                        Spacer()
                        Text("$\(cartManager.total).00")
                            .bold()
                    }
                    .padding()
                    
                    PaymentButton(action: cartManager.pay)
                        .padding()
                    
                    
                }
            }
            .navigationTitle(Text("My Cart"))
            .padding(.top)
            .onDisappear {
                if cartManager.paymentSuccess {
                    cartManager.paymentSuccess = false
                }
            }
        }else{
            VStack{
                Spacer()
                Image(systemName: "bag.badge.minus")
                    .font(.system(size: 60))
                Text("Your cart is empty.")
                    .padding()
                Spacer()
            }
        }
        
    }
}
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}


