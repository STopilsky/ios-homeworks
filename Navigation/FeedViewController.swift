//
//  FeedViewController.swift
//  Navigation
//
//  Created by Сергей Топильский on 17.08.2022.
//

import UIKit

class FeedViewController: UIViewController {

    var post = Post(title: "My first post")

    private var firstButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("First Button", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .systemIndigo
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.masksToBounds = false
        button.addTarget(self, action: #selector(didTupButton), for: .touchUpInside)
        return button
    } ()

    private var secondButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Second Button", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .systemMint
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.masksToBounds = false
        button.addTarget(self, action: #selector(didTupButton), for: .touchUpInside)
        return button
    }()

    private lazy var twoButtonsStackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        self.view.addSubview(twoButtonsStackView)
        self.twoButtonsStackView.addArrangedSubview(firstButton)
        self.twoButtonsStackView.addArrangedSubview(secondButton)

        let twoButtonsStackViewConstraints = twoButtonsStackViewConstraints()
        NSLayoutConstraint.activate(twoButtonsStackViewConstraints)
    }

    private func twoButtonsStackViewConstraints() -> ([NSLayoutConstraint]) {
        let centerYConstraint = self.twoButtonsStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        let centerXConstraint = self.twoButtonsStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let heightConstraint = self.twoButtonsStackView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3)
        let widthConstraint = self.twoButtonsStackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8)
        return ([centerYConstraint, centerXConstraint, heightConstraint, widthConstraint])
    }

    @objc private func didTupButton() {
        let postViewController = PostViewController ()
        postViewController.titlePost = post.title
        self.navigationController?.pushViewController(postViewController, animated: true)
    }

}
