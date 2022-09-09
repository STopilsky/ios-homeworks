//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Сергей Топильский on 30.08.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    var profileTitle = "Profile"
    var statusText = "Waiting for something..."
    
    private lazy var avatarImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 16, y: 16, width: 100, height: 100))
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "defaultavatar")
        return imageView
    }()

    private lazy var showStatusButton: UIButton = {
        let showStatusButton = UIButton(frame: CGRect(x: 16, y: 158, width: 382, height: 50))
        showStatusButton.layer.cornerRadius = 12  //скругления увеличены с 4pt до 12pt для визуального соответствия макету
        showStatusButton.setTitle("Status Change", for: .normal)
        showStatusButton.backgroundColor = .systemBlue
        showStatusButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        showStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatusButton.layer.shadowRadius = 4
        showStatusButton.layer.shadowOpacity = 0.7
        showStatusButton.layer.masksToBounds = false
        showStatusButton.addTarget(self, action: #selector(didTupStatusButton), for: .touchUpInside)
        return showStatusButton
    }()

    private lazy var nameLabel: UILabel = {
        let name = UILabel(frame: CGRect(x: 136, y: 27, width: 262, height: 20))
        name.text = "Hipster Cat"
        name.font = UIFont.boldSystemFont(ofSize: 18)
        name.textColor = .black
        return name
    }()

    private lazy var currentStatusLabel: UILabel = {
        let name = UILabel(frame: CGRect(x: 136, y: 78, width: 262, height: 20))
        name.text = statusText
        name.font = UIFont.systemFont(ofSize: 14)
        name.textColor = .gray
        return name
    }()

    private lazy var newStatusTextField: UITextField = {
        let newStatusTextField = UITextField(frame: CGRect(x: 136, y: 108, width: 262, height: 40))
        newStatusTextField.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: 10, height: self.frame.height))
        newStatusTextField.leftViewMode = .always
        newStatusTextField.layer.cornerRadius = 12
        newStatusTextField.backgroundColor = .white
        newStatusTextField.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        newStatusTextField.layer.borderWidth = 1
        newStatusTextField.textColor = .black
        newStatusTextField.font = UIFont.systemFont(ofSize: 15)
        newStatusTextField.addTarget(self, action: #selector(statusTextChange), for: .editingChanged)
        return newStatusTextField
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func setupView() {
        self.backgroundColor = .lightGray
        self.addSubview(self.avatarImage)
        self.addSubview(self.showStatusButton)
        self.addSubview(self.nameLabel)
        self.addSubview(self.currentStatusLabel)
        self.addSubview(self.newStatusTextField)
    }


    @objc private func didTupStatusButton() {
        currentStatusLabel.text = statusText
        newStatusTextField.text = ""
    }

    @objc private func statusTextChange(_ textField: UITextField) {
        statusText = textField.text ?? statusText
    }

}
