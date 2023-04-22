//
//  MenuInteractor.swift
//  InternetShop
//
//  Created by Алексей Колыченков on 18.04.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//


protocol MenuBusinessLogic {
    func fetchItems()
}

protocol MenuDataStore {
    var items: [ResponseModel] { get }

}

class MenuInteractor: MenuBusinessLogic, MenuDataStore {

    var presenter: MenuPresentationLogic?
    var items: [ResponseModel] = []
    
    func fetchItems(){
     
        NetworkManager.shared.fetchData([ResponseModel].self,
                                        from: Link.fakeDataProducts.rawValue) { [weak self] result in
            switch result {
            case .success(let items):
                self?.items = items
                let response = Menu.Model.Response(response: items)
                self?.presenter?.presentData(response: response)
            case .failure(let error):
                print(error)
            }
        }
    }
}

