//
//  HomeView.swift
//  TechVerse
//
//  Created by Bahadır Kılınç on 15.07.2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        
        NavigationView{

            ScrollView(.vertical,showsIndicators: false){
                VStack{
                    TabView {
                        ForEach(news) { new in
                            Image(new.image)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(12)
                                .padding(.top, 10)
                                .padding(.horizontal, 15)
                        }
                    }
                    .frame(height: UIScreen.main.bounds.width / 1.475)
                    .padding(.vertical, 20)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))

                    ScrollView(.horizontal, showsIndicators: false, content: {
                        LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: [], content: {
                            Section(
                                header: SectionView(rotateClockwise: false),
                                footer: SectionView(rotateClockwise: true)
                            ) {
                                ForEach(categories) { category in // navigation link
                                    NavigationLink(destination: {
                                        CategorizedItemView(category: category)
                                            .environmentObject(cartManager)
                                    }, label: {
                                        HStack(alignment: .center, spacing: 6) {
                                            Text(category.name.uppercased())
                                                .fontWeight(.light)
                                                .foregroundColor(.white)
                                        } //: HSTACK
                                        .padding()
                                        .background(Color.gray.cornerRadius(12))
                                        .background(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.black, lineWidth: 1)
                                        )
                                    })
                                }
                            }
                        })
                        .frame(height: 140)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                    })
                    
                    HStack {
                        Text("Products")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 15)
                    .padding(.bottom, 10)
                    
                    LazyVGrid(columns: gridLayout, spacing: 15, content: {
                        ForEach(products) { product in
                            NavigationLink(destination: ProductDetailView(product: product)
                                .environmentObject(cartManager), label:{ ProductCard(product: product)
                                .environmentObject(cartManager)})
                        }
                    })
                    .padding(15)
                    
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        .ignoresSafeArea()
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
