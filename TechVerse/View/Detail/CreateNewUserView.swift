//
//  CreateNewUserView.swift
//  TechVerse
//
//  Created by Bahadır Kılınç on 23.07.2022.
//

// when new user created save its information to firebase

import SwiftUI
import Firebase
struct CreateNewUserView: View {
    @State private var email = "bahadir@123.com"
    @State private var password = "bahadir123"
    @State private var phoneNumber = ""
    @State private var address = ""
    @State private var errorShowing = false
    @State private var errorMessage = ""
    @Binding var userLoggedIn: Bool
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            TextField("", text: $email)
                .placeholder(when: email.isEmpty) {
                    Text("E-Mail").foregroundColor(.white)
                }
                .modifier(TextModifier())
            SecureField("", text: $password)
                .placeholder(when: password.isEmpty) {
                    Text("Password").foregroundColor(.white)
                }
                .modifier(TextModifier())
            TextField("", text: $phoneNumber)
                .placeholder(when: phoneNumber.isEmpty) {
                    Text("Phone Number").foregroundColor(.white)
                }
                .modifier(TextModifier())
            TextField("", text: $address)
                .placeholder(when: address.isEmpty) {
                    Text("Address").foregroundColor(.white)
                }
                .modifier(TextModifier())
            Spacer()
            Button(action: {
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    if error != nil {
                        errorMessage = error?.localizedDescription ?? ""
                        errorShowing = true
                    } else {
                        UINotificationFeedbackGenerator().notificationOccurred(.success)
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                        if error != nil {
                            errorMessage = error?.localizedDescription ?? ""
                            errorShowing = true
                        } else {
                            userLoggedIn = true
                            UINotificationFeedbackGenerator().notificationOccurred(.success)
                        }
                    }
                }
                
                let db = Firestore.firestore()
                db.collection("Users").document(email).setData([
                    "phoneNumber" : phoneNumber,
                    "address" : address
                ])
            }, label:{
                Spacer()
                Text("SIGN ME UP")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                Spacer()
            })
            .alert(errorMessage, isPresented: $errorShowing){
                Button("OK",role: .cancel) {}
            }
            .padding()
            .foregroundColor(.white)
            .background(Rectangle().fill(.black).cornerRadius(10))
        }.padding()
    }
}

struct CreateNewUserView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewUserView(userLoggedIn: .constant(true))
    }
}
