//
//  ProductRow.swift
//  TechVerse
//
//  Created by Bahadır Kılınç on 18.07.2022.
//

import SwiftUI
struct ProductRow: View {
    @EnvironmentObject var cartManager: CartManager
    @State var item: CartItem
    
    var body: some View {
        HStack(spacing: 20) {
            
            Image(item.product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(item.product.name)
                    .bold()
                
                Text("$\(item.product.price)")

                
            }

            Text("\(item.quantity)")
            Stepper(onIncrement: {
                cartManager.addToCart(product: item.product)
            }, onDecrement: {
                cartManager.removeOneQuantity(of: item.product)
            }) {}
            
            Spacer()
            Image(systemName: "trash")
                .foregroundColor(Color(hue: 1.0, saturation: 0.8, brightness: 0.8))
                .onTapGesture {
                    cartManager.removeFromCart(product: item.product)
                }
        }
        .padding(.all)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(item: CartItem(product: products[1]))
            .environmentObject(CartManager())
    }
}
