//
//  SearchView.swift
//  TechVerse
//
//  Created by Bahadır Kılınç on 22.07.2022.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var searchText = ""
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    TextField("🔍 Search", text: $searchText)
                        .padding(.all)
                        .border(Color.black, width: 5)
                        .cornerRadius(10)
                        .padding()
                }.padding()
                
                ScrollView{
                    if searchText.isEmpty{
                        ForEach(categories) { category in
                            CategorizedItemView(category: category)
                                .environmentObject(cartManager)
                        }
                    }else{
                        LazyVGrid(columns: gridLayout, spacing: 15){
                            ForEach(products.filter{$0.name.contains(searchText) || $0.category.contains(searchText)}){ product in
                                    ProductCard(product: product)
                                        .environmentObject(cartManager)
                            }
                        }
                    }
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
