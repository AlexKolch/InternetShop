//
//  Category.swift
//  InternetShop
//
//  Created by Алексей Колыченков on 19.04.2023.
//

import Foundation

enum Category: String, Codable, CaseIterable {
    case all = "All"
    case mensClothing = "Men's clothing"
    case womensClothing = "Women's clothing"
}
