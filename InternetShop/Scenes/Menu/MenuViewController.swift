//
//  MenuViewController.swift
//  InternetShop
//
//  Created by Алексей Колыченков on 18.04.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MenuDisplayLogic: AnyObject {
  func displayData(viewModel: Menu.Model.ViewModel.ViewModelData)
}

class MenuViewController: UIViewController, MenuDisplayLogic {

    private var menuTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CategoryTableViewHeader.self, forHeaderFooterViewReuseIdentifier: CategoryTableViewHeader.identifier)



        return tableView
    }()

    var interactor: MenuBusinessLogic?
    var router: (NSObjectProtocol & MenuRoutingLogic)?

    private var rows: [ItemCellViewModelProtocol] = []

  
  // MARK: Setup
  
  private func setup() {
    let viewController        = self
    let interactor            = MenuInteractor()
    let presenter             = MenuPresenter()
    let router                = MenuRouter()
    viewController.interactor = interactor
    viewController.router     = router
    interactor.presenter      = presenter
    presenter.viewController  = viewController
    router.viewController     = viewController
  }
  
  // MARK: Routing
  

  
  // MARK: View lifecycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.dataSource = self
        menuTableView.delegate = self
        addSubviews()
        setupConstraints()
    }
  
    func displayData(viewModel: Menu.Model.ViewModel.ViewModelData) {

    }



    private func addSubviews() {
        view.addSubview(menuTableView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            menuTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menuTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            menuTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            menuTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        default: return
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
