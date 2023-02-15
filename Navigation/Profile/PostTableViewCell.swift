//
//  CustomTableViewCell.swift
//  Navigation
//
//  Created by Сергей Топильский on 03.12.2022.
//

import UIKit
import SnapKit
import iOSIntPackage

class PostTableViewCell: UITableViewCell {
    
    private lazy var authorNamelabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()

    private lazy var postImageView: UIImageView = {
        let postImageView = UIImageView()
        postImageView.contentMode = .scaleAspectFit
        postImageView.backgroundColor = .black
        return postImageView
    }()

    private lazy var descriptionlabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        return label
    }()

    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()

    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
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
        self.imageFilter(named: image)
        self.likesLabel.text = "Likes: \(likes)"
        self.viewsLabel.text = "Views: \(views)"
    }

    private func imageFilter (named image: String) {
        let filter = ImageProcessor()
        filter.processImage(sourceImage: UIImage(named: image)!, filter: .chrome) { filtredImage in
            self.postImageView.image = filtredImage
        }
    }

    private func setupContentView() {
        self.contentView.addSubview(self.authorNamelabel)
        self.contentView.addSubview(self.postImageView)
        self.contentView.addSubview(self.descriptionlabel)
        self.contentView.addSubview(self.likesLabel)
        self.contentView.addSubview(self.viewsLabel)

        self.authorNamelabel.snp.makeConstraints {make in
            make.top.leading.trailing.equalToSuperview().inset(16)
        }

        self.postImageView.snp.makeConstraints {make in
            make.top.equalTo(self.authorNamelabel.snp.bottom).offset(12)
            make.centerX.leading.trailing.equalToSuperview()
            make.height.equalTo(self.contentView.frame.width)
        }

        self.descriptionlabel.snp.makeConstraints {make in
            make.top.equalTo(self.postImageView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        self.likesLabel.snp.makeConstraints {make in
            make.top.equalTo(self.descriptionlabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(8)
        }

        self.viewsLabel.snp.makeConstraints {make in
            make.top.bottom.equalTo(self.likesLabel)
            make.trailing.equalToSuperview().inset(16)
        }
    }
}
