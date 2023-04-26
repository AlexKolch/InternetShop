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

protocol MenuDataStore {
    var items: [MenuItem] { get }
}

class MenuInteractor: MenuBusinessLogic, MenuDataStore {

    var presenter: MenuPresentationLogic?
    var items: [MenuItem] = []
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkManager())

    
    func makeRequest(request: Menu.Model.Request.RequestType) {
        switch request {
        case .getMenu:

            fetcher.getData { response in
                guard let response = response else { return }
                self.items = response
                self.presenter?.presentData(response: Menu.Model.Response.ResponseType.presentResponse(response: response))
            }
        }
    }
}

