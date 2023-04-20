//
//  ResponseModel.swift
//  InternetShop
//
//  Created by Алексей Колыченков on 19.04.2023.
//

import Foundation
/// Model для data
struct MenuResponseWrapped: Decodable {
    let response: ResponseModel
}

struct ResponseModel: Decodable {
    let id: Int
    let image: URL
    let title: String
    let description: String
    let price: Double
    let category: Category
    let rating: Rating
}

struct Rating: Codable {
    let rate: Double
    let count: Int
}
