//
//  MenuRouter.swift
//  InternetShop
//
//  Created by Алексей Колыченков on 18.04.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@objc protocol MenuRoutingLogic {
    func routeToItemDetails(value: Int)
}

protocol MenuDataPassing {
    var dataStore: MenuDataStore? { get }
}

class MenuRouter: NSObject, MenuRoutingLogic, MenuDataPassing {
    weak var viewController: MenuViewController?
    var dataStore: MenuDataStore?

    // MARK: Routing
    func routeToItemDetails(value: Int) {
        let detailVC = ItemDetailsViewController()
        guard let dataStore = dataStore,
              let viewController = viewController,
              var detailDC = detailVC.router?.dataStore else { fatalError("Fail route to detail")}

        navigateToItemDetails(source: viewController, destination: detailVC)
        passDataToItemDetails(source: dataStore, destination: &detailDC, indexPathRow: value)
    }

    // MARK: Navigation
    func navigateToItemDetails(source: MenuViewController, destination: ItemDetailsViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }

    // MARK: Passing data
    func passDataToItemDetails(source: MenuDataStore, destination: inout ItemDetailsDataStore, indexPathRow: Int) {
        destination.item = source.items[indexPathRow]
    }
}
