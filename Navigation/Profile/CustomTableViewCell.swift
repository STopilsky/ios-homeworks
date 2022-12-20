//
//  CustomTableViewCell.swift
//  Navigation
//
//  Created by Сергей Топильский on 03.12.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    private lazy var authorNamelabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var postImageView: UIImageView = {
        let postImageView = UIImageView()
        postImageView.contentMode = .scaleAspectFit
        postImageView.backgroundColor = .black
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        return postImageView
    }()

    private lazy var descriptionlabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupContentView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup (author: String, description: String, image: String, likes: Int, views: Int) {
        self.authorNamelabel.text = author
        self.descriptionlabel.text = description
        self.postImageView.image = UIImage(named: image)
        self.likesLabel.text = "Likes: \(likes)"
        self.viewsLabel.text = "Views: \(views)"
    }

    private func setupContentView() {
        self.contentView.addSubview(self.authorNamelabel)
        self.contentView.addSubview(self.postImageView)
        self.contentView.addSubview(self.descriptionlabel)
        self.contentView.addSubview(self.likesLabel)
        self.contentView.addSubview(self.viewsLabel)

        NSLayoutConstraint.activate([
            self.authorNamelabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            self.authorNamelabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.authorNamelabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),

            self.postImageView.topAnchor.constraint(equalTo: self.authorNamelabel.bottomAnchor, constant: 12),
            self.postImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.postImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.postImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.postImageView.heightAnchor.constraint(equalToConstant: self.contentView.frame.width),

            self.descriptionlabel.topAnchor.constraint(equalTo: self.postImageView.bottomAnchor, constant: 16),
            self.descriptionlabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.descriptionlabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),

            self.likesLabel.topAnchor.constraint(equalTo: self.descriptionlabel.bottomAnchor, constant: 16),
            self.likesLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            self.likesLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),

            self.viewsLabel.topAnchor.constraint(equalTo: self.likesLabel.topAnchor),
            self.viewsLabel.bottomAnchor.constraint(equalTo: self.likesLabel.bottomAnchor),
            self.viewsLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
        ])
    }
}
