//
//  MenuViewController.swift
//  InternetShop
//
//  Created by Алексей Колыченков on 18.04.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MenuDisplayLogic: AnyObject {
    func displayData(viewModel: Menu.Model.ViewModel)
}

class MenuViewController: UIViewController, MenuDisplayLogic {

    private var menuTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(BannerTableViewCell.self, forCellReuseIdentifier: BannerTableViewCell.identifier)
        tableView.register(CategoryTableViewHeader.self, forHeaderFooterViewReuseIdentifier: CategoryTableViewHeader.identifier)
        tableView.register(MenuCell.self, forCellReuseIdentifier: MenuCell.identifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemGray6
        return tableView
    }()

    var interactor: MenuBusinessLogic?
    var router: (NSObjectProtocol & MenuRoutingLogic)?

    private var activityIndicator: UIActivityIndicatorView?
    private var rows: [MenuCellViewModelProtocol] = []

    private let header = CategoryTableViewHeader()
    let currentCategory: Category = .all

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
        view.backgroundColor = .systemGray6
        view.addSubview(menuTableView)
        menuTableView.dataSource = self
        menuTableView.delegate = self
        activityIndicator = showActivityIndicator(in: view)
        setupConstraints()
        interactor?.makeRequest(request: Menu.Model.Request.RequestType.getMenu)
    }

    private func showActivityIndicator(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .lightGray
        activityIndicator.startAnimating()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        return activityIndicator
    }
  
    func displayData(viewModel: Menu.Model.ViewModel) {
        rows = viewModel.rows
        activityIndicator?.stopAnimating()
        menuTableView.reloadData()
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
        default: return rows.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: BannerTableViewCell.identifier, for: indexPath)
            return cell
        default:
            let cellViewModel = rows[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.identifier, for: indexPath)
            guard let cell = cell as? MenuCell else { return UITableViewCell() }
            cell.viewModel = cellViewModel
            if indexPath.item == 0, indexPath.row == 0 {
                cell.layer.cornerRadius = 36
                cell.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            }

            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0: return nil
        default:
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CategoryTableViewHeader.identifier)
            return headerView
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 100
        default: return rows[indexPath.row].height
        }
    }
}
