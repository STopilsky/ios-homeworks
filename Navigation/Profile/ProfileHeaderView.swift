//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Сергей Топильский on 30.08.2022.
//

import UIKit

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
        imageView.translatesAutoresizingMaskIntoConstraints = false

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
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var nameLabel: UILabel = {
        let name = UILabel(frame: .zero)
        name.text = "Hipster Cat"
        name.font = UIFont.boldSystemFont(ofSize: 18)
        name.textColor = .black
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()

    private lazy var currentStatusLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = statusText
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
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
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var avatarBackgroundView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .darkGray
        view.isHidden = true
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
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
        button.translatesAutoresizingMaskIntoConstraints = false
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
        self.backgroundColor = .darkGray
        self.addSubview(self.changeStatusButton)
        self.addSubview(self.nameLabel)
        self.addSubview(self.currentStatusLabel)
        self.addSubview(self.newStatusTextField)
        self.addSubview(self.avatarBackgroundView)
        self.addSubview(self.avatarImage)
        self.addSubview(self.closeButton)

        self.avatarImageWidth = self.avatarImage.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.3)
        self.avatarImageHeight = self.avatarImage.heightAnchor.constraint(equalTo: self.avatarImage.widthAnchor)
        self.avatarImageTop = self.avatarImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        self.avatarImageLeft = self.avatarImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)

        self.constraintsActivating()

    }

    private func constraintsActivating() {
        NSLayoutConstraint.activate([
            self.avatarImageTop!,
            self.avatarImageLeft!,
            self.avatarImageWidth!,
            self.avatarImageHeight!,

            self.changeStatusButton.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 16),
            self.changeStatusButton.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -16),
            self.changeStatusButton.heightAnchor.constraint(equalTo: avatarImage.heightAnchor, multiplier: 0.3),
            self.changeStatusButton.leadingAnchor.constraint(equalTo: avatarImage.leadingAnchor),
            self.changeStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

            self.nameLabel.topAnchor.constraint(equalTo: avatarImage.topAnchor),
            self.nameLabel.heightAnchor.constraint(equalTo: avatarImage.heightAnchor, multiplier: 0.2),
            self.nameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 20),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

            self.currentStatusLabel.centerYAnchor.constraint(equalTo: avatarImage.centerYAnchor),
            self.currentStatusLabel.heightAnchor.constraint(equalTo: avatarImage.heightAnchor, multiplier: 0.2),
            self.currentStatusLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 20),
            self.currentStatusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

            self.newStatusTextField.bottomAnchor.constraint(equalTo: avatarImage.bottomAnchor),
            self.newStatusTextField.heightAnchor.constraint(equalTo: avatarImage.heightAnchor, multiplier: 0.2),
            self.newStatusTextField.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 20),
            self.newStatusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

            self.avatarBackgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            self.avatarBackgroundView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.avatarBackgroundView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            self.avatarBackgroundView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),

            self.closeButton.topAnchor.constraint(equalTo: avatarBackgroundView.topAnchor),
            self.closeButton.trailingAnchor.constraint(equalTo: avatarBackgroundView.trailingAnchor),
            self.closeButton.heightAnchor.constraint(equalToConstant: 50),
            self.closeButton.widthAnchor.constraint(equalTo: closeButton.heightAnchor)
        ])
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
