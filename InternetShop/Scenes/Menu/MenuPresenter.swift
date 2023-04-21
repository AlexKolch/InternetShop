//
//  MenuPresenter.swift
//  InternetShop
//
//  Created by Алексей Колыченков on 18.04.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MenuPresentationLogic {
    func presentData(response: Menu.Model.Response.ResponseType)
}

class MenuPresenter: MenuPresentationLogic {
    weak var viewController: MenuDisplayLogic?

    func presentData(response: Menu.Model.Response.ResponseType) {
        switch response {
        case .presentResponse(let menu):
            let cells = menu.map { responseItem in
                cellViewModel(from: responseItem)
            }
            let menuViewModel = MenuViewModel(cells: cells)
            viewController?.displayData(viewModel: MenuCellViewModel.displayMenu(menuViewModel: menuViewModel))
        }
    }


    private func cellViewModel(from responseModel: WelcomeElement) -> MenuViewModel.Cell {
        return MenuViewModel.Cell(identifier: String(responseModel.id), height: 150, name: responseModel.title, description: responseModel.description, imageURL: responseModel.image, price: responseModel.price, category: responseModel.category.rawValue)
    }
}
