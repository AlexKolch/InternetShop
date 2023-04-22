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
        case .presentResponse(let menuItems):
            let cells = menuItems.map { responseItem in
                configureCellViewModel(from: responseItem)
            }
            let menuViewModel = MenuViewModel(cells: cells)
            viewController?.displayData(viewModel: MenuCellViewModel.displayMenu(menuViewModel: menuViewModel))
        }
    }


    private func configureCellViewModel(from response: MenuItem) -> MenuViewModel.Cell {
        return MenuViewModel.Cell(identifier: "MenuCell",
                                  height: 150,
                                  name: response.title,
                                  description: response.description,
                                  imageURL: response.image,
                                  price: response.price,
                                  category: response.category.rawValue)
    }
}
