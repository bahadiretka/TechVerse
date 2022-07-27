//
//  TextModifier.swift
//  TechVerse
//
//  Created by Bahadır Kılınç on 23.07.2022.
//

import Foundation
import SwiftUI

struct TextModifier: ViewModifier{
    func body(content: Content) -> some View {
            content
            .foregroundColor(.white)
            .font(.system(size: 24, weight: .bold, design: .rounded))
            .padding()
            .background(.black)
            .cornerRadius(10)
        }
}
