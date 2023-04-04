//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Сергей Топильский on 10.12.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private lazy var photosLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.text = "Photos"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var arrow: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var photosPreView: UICollectionView = {
        let photosView = UICollectionView(frame: .zero, collectionViewLayout: self.photosPreViewLayout)
        photosView.translatesAutoresizingMaskIntoConstraints = false
        photosView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        photosView.dataSource = self
        photosView.delegate = self
        photosView.showsHorizontalScrollIndicator = false
        return photosView
    }()

    private lazy var photosPreViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        return layout
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupContentView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupContentView() {
        self.contentView.addSubview(self.photosLabel)
        self.contentView.addSubview(self.arrow)
        self.contentView.addSubview(self.photosPreView)

        NSLayoutConstraint.activate([
            self.photosLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            self.photosLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),

            self.arrow.centerYAnchor.constraint(equalTo: self.photosLabel.centerYAnchor),
            self.arrow.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),

            self.photosPreView.topAnchor.constraint(equalTo: self.photosLabel.bottomAnchor, constant: 12),
            self.photosPreView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),
            self.photosPreView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
            self.photosPreView.heightAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.15),
            self.photosPreView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12)
        ])
    }
}

extension PhotosTableViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotosCollectionViewCell
        cell.setup(image: UIImage(named: "picture\(indexPath.row+1)")!)
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        return cell
    }
}

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 4 - 8, height: collectionView.frame.height)
    }
}
