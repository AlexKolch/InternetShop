//
//  MenuModels.swift
//  InternetShop
//
//  Created by Алексей Колыченков on 18.04.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

typealias MenuCellViewModel = Menu.Model.ViewModel.ViewModelData

enum Menu {
    enum Model {

        struct Request {
            enum RequestType {
                case getMenu
            }
        }

        struct Response {
            enum ResponseType {
                case presentResponse(response: [MenuItem])
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
        var imageURL: String
        var price: Double
        var category: String
    }
    ///Массив с подготовленной информацией о каждой ячейки
    let cells: [Cell]
}
