//
//  TabBarController.swift
//  InternetShop
//
//  Created by Алексей Колыченков on 18.04.2023.
//

import UIKit

class TabBarController: UITabBarController {
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupItems()
    }
    
    private func setupTabBar(){
        tabBar.backgroundColor = .systemGray6
        tabBar.tintColor = UIColor(named: "customRed")
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
    }

    private func setupItems(){
        let menuVC = MenuViewController()
        let contactsVC = ContactsViewController()
        let profileVC = ProfileViewController()
        let cartVC = CartViewController()

        let menuNavBarVC = UINavigationController(rootViewController: menuVC)

        setViewControllers([menuNavBarVC, profileVC, cartVC, contactsVC], animated: true)

        guard let items = tabBar.items else { return }

        items[0].title = "Shop"
        items[1].title = "Profile"
        items[2].title = "Basket"
        items[3].title = "Contacts"

        items[0].image = UIImage(systemName: "menubar.dock.rectangle")
        items[1].image = UIImage(systemName: "person")
        items[2].image = UIImage(systemName: "cart")
        items[3].image = UIImage(systemName: "phone")
    }
}
