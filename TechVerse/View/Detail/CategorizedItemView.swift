//
//  CategorizedItemView.swift
//  TechVerse
//
//  Created by Bahadır Kılınç on 26.07.2022.
//

import SwiftUI

struct CategorizedItemView: View {
    @EnvironmentObject var cartManager: CartManager
    var category: Category
    var body: some View {
        ScrollView{
            HStack {
                Text(category.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 15)
            .padding(.bottom, 10)

            LazyVGrid(columns: gridLayout, spacing: 15, content: {
                ForEach(productsWithCategory(category: category)) { product in
                    NavigationLink(destination: ProductDetailView(product: product)
                        .environmentObject(cartManager), label:{ ProductCard(product: product)
                        .environmentObject(cartManager)})
                }
            })
            .padding(15)
        }
    }
}

struct CategorizedItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategorizedItemView(category: categories[0])
            .environmentObject(CartManager())
    }
}
