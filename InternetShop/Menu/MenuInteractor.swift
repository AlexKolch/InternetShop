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
  
  func makeRequest(request: Menu.Model.Request.RequestType) {
    if service == nil {
      service = MenuService()
    }
  }
  
}
