//
//  TechVerseApp.swift
//  TechVerse
//
//  Created by Bahadır Kılınç on 15.07.2022.
//

import SwiftUI
import Firebase
@main
struct TechVerseApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
