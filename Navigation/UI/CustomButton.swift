//
//  CustomButton.swift
//  Navigation
//
//  Created by Сергей Топильский on 10.04.2023.
//

import UIKit

final class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(title: String, backGroundColor: UIColor, target: Any?, function: Selector)  {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.backgroundColor = backGroundColor
        self.addTarget(target, action: function, for: .touchUpInside)
    }

    convenience init(title: String, backGroundImage: UIImage, target: Any?, function: Selector) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setBackgroundImage(backGroundImage, for: .normal)
        self.layer.masksToBounds = true
        self.addTarget(target, action: function, for: .touchUpInside)
    }

    private func setup() {
        self.frame = .zero
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.7
        self.layer.masksToBounds = false
        self.translatesAutoresizingMaskIntoConstraints = false
    }    
}
