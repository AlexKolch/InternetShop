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
    init(response: ResponseModel)
    var identifier: String { get }
    var height: Double { get }
    var name: String { get }
    var description: String { get }
    var imageURL: URL { get }
    var price: Double { get }
    var category: String { get }
}

enum Menu {
    enum Model {

        struct Request {
            enum RequestType {
                case getMenu
            }
        }

        struct Response {
            let response: [ResponseModel]
        }
        ///Модель с подготовленными данными новостной ленты
        struct ViewModel {
            struct MenuCellViewModel: MenuCellViewModelProtocol {
                private let response: ResponseModel
                init(response: ResponseModel) {
                    self.response = response
                }

                var identifier: String {
                    "ItemCell"
                }
                var height: Double {
                    150
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
                var price: Double {
                    response.price
                }
                var category: String {
                    response.category.rawValue
                }
            }
            ///Массив с подготовленной информацией о каждой ячейки
            let rows: [MenuCellViewModelProtocol]
        }
    }
}
