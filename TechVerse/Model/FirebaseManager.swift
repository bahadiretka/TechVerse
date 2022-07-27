//
//  FirebaseManager.swift
//  TechVerse
//
//  Created by Bahadır Kılınç on 23.07.2022.
//

import Foundation
import Firebase

struct FirebaseManager{
    
    static func getUserData(completionHandler: @escaping ([String : Any]?) -> Void){
        let db = Firestore.firestore()
        DispatchQueue.main.async() {
            let docRef = db.collection("Users").document(Auth.auth().currentUser?.email ?? "")
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    completionHandler(document.data())
                }
            }
        }
    }
}
