//
//  ContentView.swift
//  TechVerse
//
//  Created by Bahadır Kılınç on 15.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var selected = 1
    @StateObject var cartManager = CartManager()
    var body: some View {
        
        TabView(selection: $selected) {
       
            HomeView()
                .environmentObject(cartManager)
                .tabItem {
                    Image(systemName: "house")
                        .onTapGesture {
                            selected = 1
                        }
                }.tag(1)
            
            SearchView()
                .environmentObject(cartManager)
                .tabItem{
                    Image(systemName: "magnifyingglass")
                        .onTapGesture {
                            selected = 2
                        }
                }
                .tag(2)
            CartView()
                .environmentObject(cartManager)
                .tabItem {
                    Image(systemName: "cart")
                        .onTapGesture {
                            selected = 3
                        }
                    
                }.tag(3)
                .badge(cartManager.items.count)
            UserInfoView()
                .tabItem {
                    Image(systemName: "person")
                        .onTapGesture {
                            selected = 4
                        }
                }.tag(4)
        }.tabViewStyle(backgroundColor: .black,
                       itemColor: .white.opacity(0.95),
                       selectedItemColor: .gray,
                       badgeColor: .red)
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
