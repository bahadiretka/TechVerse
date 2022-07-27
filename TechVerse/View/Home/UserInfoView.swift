//
//  UserInfoView.swift
//  TechVerse
//
//  Created by Bahadır Kılınç on 15.07.2022.
//

import SwiftUI
import Firebase

struct UserInfoView: View {
    @State private var userLoggedIn = Auth.auth().currentUser != nil ? true : false
    var body: some View{
        if !userLoggedIn{
            UserLoginView(userLoggedIn: $userLoggedIn)
        }else{
            UserDetailView(userLoggedIn: $userLoggedIn)
        }
        
    }
}
struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView()
    }
}
