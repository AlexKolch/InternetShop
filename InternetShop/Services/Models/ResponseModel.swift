//
//  ResponseModel.swift
//  InternetShop
//
//  Created by Алексей Колыченков on 19.04.2023.
//

import Foundation
/// Model для response
struct MenuResponseWrapped: Decodable {
    let response: ResponseModel
}

struct ResponseModel: Decodable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: Category
    let image: URL
    let rating: Rating
}

struct Rating: Codable {
    let rate: Double
    let count: Int
}
