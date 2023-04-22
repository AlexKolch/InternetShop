//
//  MenuModels.swift
//  InternetShop
//
//  Created by Алексей Колыченков on 18.04.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

typealias MenuCellViewModel = Menu.Model.ViewModel.MenuCellViewModel

protocol MenuCellViewModelProtocol {
    var identifier: String { get }
    var height: Double { get }
    var name: String { get }
    var description: String { get }
    var imageURL: URL { get }
    var price: Double { get }
    var category: String { get }
    init(response: ResponseModel)
}

enum Menu {
    enum Model {

        struct Response {
            let response: [ResponseModel]
        }
        
        ///Модель с подготовленными данными ленты
        struct ViewModel {
            struct MenuCellViewModel: MenuCellViewModelProtocol {
                var identifier: String {
                    "MenuCell"
                }
                var height: Double {
                    150
                }
                var price: Double {
                    response.price
                }
                var name: String {
                    response.title
                }
                var description: String {
                    response.description
                }
                var imageURL: URL {
                    response.image
                }
                var category: String {
                    response.category.rawValue
                }
                private let response: ResponseModel

                init(response: ResponseModel) {
                    self.response = response
                }
            }
            ///Массив с подготовленной информацией о каждой ячейки
            let rows: [MenuCellViewModelProtocol]
        }
    }
}
