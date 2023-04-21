//
//  BannerTableViewCell.swift
//  InternetShop
//
//  Created by Алексей Колыченков on 20.04.2023.
//

import UIKit

class BannerTableViewCell: UITableViewCell {
    // MARK: - Identifier
    static let identifier = "BannerTableViewCell"
    // MARK: - Private Properties
    private var banners = Banner.getBanner()

    // MARK: - UI Elements
    private lazy var bannersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 250, height: 100)
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemGray6
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupView()
        setupConstraints()
    }
}

extension BannerTableViewCell {
    private func setupView() {
        //contentView.backgroundColor = .systemGray6
        contentView.addSubview(bannersCollectionView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            bannersCollectionView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            bannersCollectionView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            bannersCollectionView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            bannersCollectionView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewDelegate And UICollectionViewDataSource
extension BannerTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        banners.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as! ImageCollectionViewCell

        let banner = banners[indexPath.item]
        cell.updateView(with: banner)
        return cell
    }
}
