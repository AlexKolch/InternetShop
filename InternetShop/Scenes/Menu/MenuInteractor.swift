//
//  MenuInteractor.swift
//  InternetShop
//
//  Created by Алексей Колыченков on 18.04.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MenuBusinessLogic {
    func makeRequest(request: Menu.Model.Request.RequestType)
}

class MenuInteractor: MenuBusinessLogic {

    var presenter: MenuPresentationLogic?
    var service: MenuService?
    var items: [ResponseModel] = []
  //  private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkManager())

    
    func makeRequest(request: Menu.Model.Request.RequestType) {
        if service == nil {
            service = MenuService()
        }

        switch request {
        case .getMenu:
            NetworkManager.shared.fetchData([ResponseModel].self, from: Link.fakeDataProducts.rawValue) { [weak self] result in
                switch result {
                case .success(let items):
                    self?.items = items
                    let response = Menu.Model.Response(response: items)
                    self?.presenter?.presentData(response: response)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

