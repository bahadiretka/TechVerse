//
//  ProductDetailView.swift
//  TechVerse
//
//  Created by Bahadır Kılınç on 25.07.2022.
//

import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    @State private var counter = 0
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack{
                TabView {
                    Image(product.image)
                        .resizable()
                        .scaledToFit()
                    Image(systemName: "viewfinder")
                } 
                .frame(height: UIScreen.main.bounds.width / 1.475)
                .padding(.vertical, 20)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                ScrollView{
                    Text(product.description)
                        .padding()
                }.frame(height: 120)
                HStack{
                    Button(action: {
                        if counter > 0{
                            counter -= 1
                        }
                    }) {
                        Image(systemName: "minus.circle")
                            .foregroundColor(.black)
                            .font(.system(size: 24))
                    }
                    Text("\(counter)")
                        .font(.system(size: 24))
                    Button(action: {
                        if counter < 100 {
                            counter += 1
                        }
                    }) {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.black)
                            .font(.system(size: 24))
                    }
                }
                .padding()
                
                HStack{
                    Button(action: {
                        cartManager.addToCart(product: product, quantity: counter)
                    }) {
                        Spacer()
                        Text("ADD TO CART")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                        Spacer()
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Rectangle().fill(.black).cornerRadius(10))
                }.padding()
            }
        })
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: products[0])
            .environmentObject(CartManager())
    }
}
