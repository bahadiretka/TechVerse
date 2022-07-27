//
//  UserDetailView.swift
//  TechVerse
//
//  Created by Bahadır Kılınç on 16.07.2022.
//

import SwiftUI
import Firebase

struct UserDetailView: View {
    @State private var presented = false
    @Binding var userLoggedIn: Bool
    @State private var errorMessage = ""
    @State private var userData: [String:Any]?
    var body: some View {
        
        VStack{
            Image("user-detail-background")
                
            NavigationView{
                Form {
                    HStack{
                        Text("E-Mail")
                        Spacer()
                        Text(Auth.auth().currentUser?.email ?? "")
                    }
                    HStack{
                        Text("Phone Number")
                        Spacer()
                        Text(userData?["phoneNumber"] as? String ?? "" )
                    }
                    HStack{
                        Text("Adress")
                        Spacer()
                        Text(userData?["address"] as? String ?? "")
                    }
                    NavigationLink("Orders", destination: {OrdersView(userData: userData)})
                    
                    NavigationLink("Change Password", destination: {ChangePasswordView()})
                    Section{
                        Button(action: {
                            do{
                                try Auth.auth().signOut()
                                userLoggedIn.toggle()
                            }catch let error{
                                errorMessage = error.localizedDescription
                            }
                        }, label: {
                            HStack{
                                Spacer()
                                Text("Sign Out")
                                    .foregroundColor(.red)
                                Spacer()
                            }
                            
                        })
                    }
                    
                }.alert(isPresented: $presented){
                    Alert(title: Text(errorMessage))
                }
                .navigationTitle("User Detail")
            }
            
        }.onAppear(perform: {
            FirebaseManager.getUserData { data in
                userData = data
            }
        })
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(userLoggedIn: .constant(true))
    }
}
