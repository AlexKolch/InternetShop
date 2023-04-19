//
//  CategoryTableViewHeader.swift
//  InternetShop
//
//  Created by Алексей Колыченков on 18.04.2023.
//

import UIKit

class CategoryTableViewHeader: UITableViewHeaderFooterView {
    // MARK: - Identifier
    static let identifier = "HeaderID"

    // MARK: - Properties
    private var categoriesScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width + 200, height: .zero)
        return scrollView
    }()

    private var categoriesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()

    private var categoriesButtons: UIButton = {
        let button = UIButton(type: .roundedRect)
        for categories in Menu.Category.allCases {
            button.translatesAutoresizingMaskIntoConstraints = false
            button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            button.setTitle(categories.rawValue, for: .normal)
            button.setTitleColor(UIColor(named: "customRed"), for: .normal)
            button.contentScaleFactor = .leastNormalMagnitude
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor(named: "customRed")?.cgColor
            button.layer.cornerRadius = 12
            button.widthAnchor.constraint(equalToConstant: 120).isActive = true
        }
        return button
    }()

    override init(reuseIdentifier: String?) {
        super .init(reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setupView() {
        contentView.backgroundColor = .systemGray6
        addSubview(categoriesScrollView)
        categoriesScrollView.addSubview(categoriesStackView)
        categoriesStackView.addArrangedSubview(categoriesButtons)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            categoriesStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            categoriesScrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            categoriesScrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            categoriesScrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            categoriesStackView.leadingAnchor.constraint(equalTo: categoriesScrollView.leadingAnchor, constant: 16),
            categoriesStackView.trailingAnchor.constraint(equalTo: categoriesScrollView.trailingAnchor, constant: -16),
            categoriesStackView.centerYAnchor.constraint(equalTo: categoriesScrollView.centerYAnchor)
        ])
    }
}
