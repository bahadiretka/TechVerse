//
//  UserLoginView.swift
//  TechVerse
//
//  Created by Bahadır Kılınç on 16.07.2022.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct UserLoginView: View {
    @State private var email = "bahadir@123.com"
    @State private var password = "bahadir123"
    @State private var newUserShowing = false
    @State private var signInShowing = false
    @Binding var userLoggedIn: Bool
    
    var body: some View {
        
        VStack{
            Spacer()
            HStack{
                Button(action: {
                    newUserShowing.toggle()
                }, label:{
                    Spacer()
                    Text("Create a new user")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                })
                .padding()
                .foregroundColor(.white)
                .background(Rectangle().fill(.black).cornerRadius(10))
                .sheet(isPresented: $newUserShowing) {
                    CreateNewUserView(userLoggedIn: $userLoggedIn)
                }
            }.padding()
            
            HStack{
                Button(action: {
                    signInShowing.toggle()
                }, label:{
                    Spacer()
                    Text("I have already an account")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                })
                .padding()
                .foregroundColor(.white)
                .background(Rectangle().fill(.black).cornerRadius(10))
                .sheet(isPresented: $signInShowing) {
                    UserSignInView(userLoggedIn: $userLoggedIn)
                }
            }.padding()
        }
        .padding()
    }
    
}

struct UserLoginView_Previews: PreviewProvider {
    static var previews: some View {
        UserLoginView(userLoggedIn: .constant(false))
    }
}
