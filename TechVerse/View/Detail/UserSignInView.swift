//
//  UserSignInView.swift
//  TechVerse
//
//  Created by Bahadır Kılınç on 23.07.2022.
//

import SwiftUI
import Firebase
struct UserSignInView: View {
    
    @State private var email = "bahadir@123.com"
    @State private var password = "bahadir123"
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
            Spacer()
            Button(action: {
                Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                    if error != nil {
                        errorMessage = error?.localizedDescription ?? ""
                        errorShowing = true
                    } else {
                        UINotificationFeedbackGenerator().notificationOccurred(.success)
                        userLoggedIn = true
                    }
                }
            
            }, label:{
                Spacer()
                Text("SIGN ME IN")
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
struct UserSignInView_Previews: PreviewProvider {
    static var previews: some View {
        UserSignInView(userLoggedIn: .constant(true))
    }
}
