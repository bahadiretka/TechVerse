//
//  ChangePasswordView.swift
//  TechVerse
//
//  Created by Bahadır Kılınç on 21.07.2022.
//

import SwiftUI
import Firebase
struct ChangePasswordView: View {
    @State private var oldPassword = ""
    @State private var newPassword = ""
    @State private var newPasswordConform = ""
    @State private var showingAlert = false
    @State private var isSuccess = false
    var body: some View {
        VStack{
            SecureField("New Password", text: $newPassword)
                .padding(.all)
                .border(Color.black, width: 4)
                .cornerRadius(3)
                .padding()
            SecureField("Confirm New Password", text: $newPasswordConform)
                .padding(.all)
                .border(Color.black, width: 4)
                .cornerRadius(3)
                .padding()
            Button(action: {
                if newPassword == newPasswordConform{
                    Auth.auth().currentUser?.updatePassword(to: newPassword)
                    isSuccess = true
                }else{
                    showingAlert = true
                }
            }, label: {
                Text("Change Password")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
            })
            .background(content: {Rectangle().cornerRadius(5)})
            .alert("Passwords should be same.", isPresented: $showingAlert){
                Button("OK",role: .cancel) {}
            }
            .alert("Your password changed succesfully.", isPresented: $isSuccess){
                Button("OK",role: .cancel) {}
            }
            Spacer()
        }
    }
}

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}
