//
//  CustomTextField.swift
//  Navigation
//
//  Created by Сергей Топильский on 11.04.2023.
//

import UIKit

class CustomTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init (text: String? = nil, backGroundColor: UIColor = .white, cornerRadius: CGFloat? = nil) {
        self.init(frame: .zero)
        self.text = text
        self.backgroundColor = backGroundColor
        self.layer.cornerRadius = cornerRadius ?? 0
    }

    private func setup() {
        self.frame = .zero
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height:0))
        self.leftViewMode = .always
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
        self.borderStyle = .line
        self.layer.borderWidth = 1
        self.textColor = .black
        self.font = UIFont.systemFont(ofSize: 15)
        self.layer.masksToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
