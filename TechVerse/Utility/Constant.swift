//
//  Constant.swift
//  TechVerse
//
//  Created by Bahadır Kılınç on 15.07.2022.
//
import Foundation
import SwiftUI

extension Bundle {
  func decode<T: Codable>(_ file: String) -> T {
    guard let url = self.url(forResource: file, withExtension: nil) else {
      fatalError("Failed to locate \(file) in bundle.")
    }
    guard let data = try? Data(contentsOf: url) else {
      fatalError("Failed to load \(file) from bundle.")
    }
    let decoder = JSONDecoder()

    guard let decodedData = try? decoder.decode(T.self, from: data) else {
      fatalError("Failed to decode \(file) from bundle.")
    }
    return decodedData
  }
}

let news: [News] = Bundle.main.decode("news.json")
let categories: [Category] = Bundle.main.decode("category.json")
let products: [Product] = Bundle.main.decode("product.json")

func productsWithCategory(category: Category) -> [Product]{
    return products.filter{$0.category == category.name}
}

let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
  return Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
}



