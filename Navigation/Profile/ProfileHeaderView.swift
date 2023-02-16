//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Сергей Топильский on 30.08.2022.
//

import UIKit
import SnapKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    var profileTitle = "Profile"
    var statusText = "Waiting for something..."
    private var isAvatarIncreased = false
    private var avatarCenterPoint = CGPoint()

    private var avatarImageWidth: NSLayoutConstraint?
    private var avatarImageHeight: NSLayoutConstraint?
    private var avatarImageTop: NSLayoutConstraint?
    private var avatarImageLeft: NSLayoutConstraint?
    
    private lazy var avatarImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "defaultavatar")

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapAvatar))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGesture)

        return imageView
    }()

    private lazy var changeStatusButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = 12
        button.setTitle("Status Change", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.masksToBounds = false
        button.addTarget(self, action: #selector(didTupChangeStatusButton), for: .touchUpInside)
        return button
    }()

    private lazy var nameLabel: UILabel = {
        let name = UILabel(frame: .zero)
        name.text = "Hipster Cat"
        name.font = UIFont.boldSystemFont(ofSize: 18)
        name.textColor = .black
        return name
    }()

    private lazy var currentStatusLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = statusText
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()

    private lazy var newStatusTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: 10, height: self.frame.height))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 12
        textField.backgroundColor = .white
        textField.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        textField.layer.borderWidth = 1
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.addTarget(self, action: #selector(statusTextChange), for: .editingChanged)
        return textField
    }()

    private lazy var avatarBackgroundView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .darkGray
        view.isHidden = true
        view.alpha = 0
        return view
    }()

    private lazy var closeButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(systemName: "xmark.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)), for: .normal)
        button.alpha = 0
        button.backgroundColor = .clear
        button.tintColor = .black
        button.contentMode = .scaleToFill
        button.layer.masksToBounds = false
        button.addTarget(self, action: #selector(closeAvatar), for: .touchUpInside)
        return button
    }()


    override func layoutSubviews() {
        super.layoutSubviews()
        self.avatarImage.layer.cornerRadius = self.isAvatarIncreased ? 0 : self.avatarImage.frame.height/2
    }

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        self.addSubview(self.changeStatusButton)
        self.addSubview(self.nameLabel)
        self.addSubview(self.currentStatusLabel)
        self.addSubview(self.newStatusTextField)
        self.addSubview(self.avatarBackgroundView)
        self.addSubview(self.avatarImage)
        self.addSubview(self.closeButton)

        self.constraintsActivating()
    }

    private func constraintsActivating() {

        self.avatarImage.snp.makeConstraints {make in
            make.width.height.equalTo(self.snp.height).multipliedBy(0.6)
            make.top.leading.equalToSuperview().inset(16)
        }

        self.changeStatusButton.snp.makeConstraints {make in
            make.bottom.equalToSuperview().inset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(self.avatarImage).multipliedBy(0.25)
        }

        self.nameLabel.snp.makeConstraints {make in
            make.top.equalTo(self.avatarImage)
            make.leading.equalTo(self.avatarImage.snp.trailing).offset(20)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(self.avatarImage).multipliedBy(0.25)
        }

        self.currentStatusLabel.snp.makeConstraints {make in
            make.centerY.equalTo(self.avatarImage)
            make.leading.trailing.height.equalTo(self.nameLabel)
        }

        self.newStatusTextField.snp.makeConstraints {make in
            make.bottom.equalTo(self.avatarImage)
            make.leading.trailing.height.equalTo(self.nameLabel)
        }

        self.avatarBackgroundView.snp.makeConstraints {make in
            make.top.centerX.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(UIScreen.main.bounds.height)
        }

        self.closeButton.snp.makeConstraints {make in
            make.top.trailing.equalTo(self.avatarBackgroundView)
            make.width.height.equalTo(50)
        }
    }

    @objc private func didTupChangeStatusButton() {
        currentStatusLabel.text = statusText
        newStatusTextField.text = ""
    }

    @objc private func didTupChangeTitleButton() {
        profileTitle = statusText
        newStatusTextField.text = ""
    }

    @objc private func statusTextChange(_ textField: UITextField) {
        statusText = textField.text ?? statusText
    }

    @objc private func didTapAvatar() {

        avatarCenterPoint = avatarImage.center
        isAvatarIncreased.toggle()

        let multiplier = UIScreen.main.bounds.width / avatarImage.bounds.width

        UIView.animate(withDuration: 0.5) {
            self.avatarImage.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY - self.avatarImage.frame.height/2)
            self.avatarImage.transform = CGAffineTransform(scaleX: multiplier, y: multiplier)
            self.avatarImage.layer.cornerRadius = 0

            self.avatarBackgroundView.isHidden = false
            self.avatarBackgroundView.alpha = 0.7

        } completion: { _ in UIView.animate(withDuration: 0.3) {
            self.closeButton.alpha = 1
        }
        }
    }

    @objc private func closeAvatar() {

        isAvatarIncreased.toggle()

        UIView.animate(withDuration: 0.5) {
            self.avatarImage.center = self.avatarCenterPoint
            self.avatarImage.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.avatarImage.layer.cornerRadius = self.avatarImage.frame.height/2

            self.avatarBackgroundView.isHidden = false
            self.avatarBackgroundView.alpha = 0
            self.closeButton.alpha = 0
        }
    }
}
