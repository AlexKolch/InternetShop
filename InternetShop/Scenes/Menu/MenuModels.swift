//
//  MenuModels.swift
//  InternetShop
//
//  Created by Алексей Колыченков on 18.04.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

typealias MenuCellViewModel = Menu.Model.ViewModel.ViewModelData

//protocol MenuCellViewModelProtocol {
//    init(response: ResponseModel)
//    var identifier: String { get }
//    var height: Double { get }
//    var name: String { get }
//    var description: String { get }
//    var imageURL: URL { get }
//    var price: Double { get }
//    var category: String { get }
//}

enum Menu {
    enum Model {

        struct Request {
            enum RequestType {
                case getMenu
            }
        }

        struct Response {
            enum ResponseType {
                case presentResponse(response: [ResponseModel])
            }
        }

        struct ViewModel {
            enum ViewModelData {
                case displayMenu(menuViewModel: MenuViewModel)
            }
        }
    }
}

///Модель с подготовленными данными меню
struct MenuViewModel {
    struct Cell: MenuCellViewModelProtocol {
        var identifier: String
        var height: Double
        var name: String
        var description: String
        var imageURL: URL
        var price: Double
        var category: String
    }
    ///Массив с подготовленной информацией о каждой ячейки
    let cells: [Cell]
}
