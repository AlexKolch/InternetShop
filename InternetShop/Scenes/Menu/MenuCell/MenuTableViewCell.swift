//
//  MenuTableViewCell.swift
//  InternetShop
//
//  Created by Алексей Колыченков on 19.04.2023.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    // MARK: - Identifier
    static let identifier = "MenuTableViewCell"

    private lazy var cellImageView: WebImageManager  = {
        let imageView = WebImageManager()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.hidesWhenStopped = true
        return activityIndicatorView
    }()

    private lazy var cellTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var cellDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 8)
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var cellPriceButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        button.setTitleColor(UIColor(named: "customRed"), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(named: "customRed")?.cgColor
        button.layer.cornerRadius = 6
        return button
    }()


    private func set(viewModel: MenuCellViewModelProtocol) {
       // cellImageView.image
        cellTitleLabel.text = viewModel.name
    }
    

}
