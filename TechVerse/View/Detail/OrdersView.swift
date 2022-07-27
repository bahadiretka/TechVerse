//
//  OrdersView.swift
//  TechVerse
//
//  Created by Bahadır Kılınç on 27.07.2022.
//

import SwiftUI

struct OrdersView: View {
    var userData: [String:Any]?
    @State private var orders = [CartItem]()
    @State var date = ""
    var body: some View {
        VStack{
            if orders.isEmpty{
                VStack{
                    Spacer()
                    Image(systemName: "bag.badge.minus")
                        .font(.system(size: 60))
                    Text("There is no order.")
                        .padding()
                    Spacer()
                }
            }else{
                ScrollView{
                    ForEach(orders){ order in
                        VStack{
                            HStack(spacing: 20) {
                                
                                Image(order.product.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50)
                                    .cornerRadius(10)
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(order.product.name)
                                        .bold()
                                    
                                    Text("$\(order.product.price)")

                                    
                                }
                                Spacer()
                                Text("Count: \(order.quantity)")

                            }
                            .padding(.all)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            Section{
                                HStack{
                                    Text("Order Date: \(date)")
                                        .fontWeight(.bold)
                                    Spacer()
                                }.padding()
                            }
                            
                        }
                    }
                }
            }
            
        }.onAppear {
            let orders = userData?["orders"] as! String
            let components = orders.components(separatedBy: "-")
            components.forEach { component in
                let elements = component.components(separatedBy: ">")
                let id = elements[0]
                let quantity = elements[1]
                self.date = elements[2]
                self.orders.append(CartItem(quantity: Int(quantity)!, id: Int(id)!))
            }
        }
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView(userData: [:])
    }
}
