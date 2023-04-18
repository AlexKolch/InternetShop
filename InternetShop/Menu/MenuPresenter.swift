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
  
  }
  
}
