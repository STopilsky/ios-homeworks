//
//  FeedViewController.swift
//  Navigation
//
//  Created by Сергей Топильский on 17.08.2022.
//

import UIKit
import StorageService

class FeedViewController: UIViewController {
    var secretWordCheckerDelegate: SecretWordCheckerDelegateProtocol?

    var titlePost = "My first post"

    private lazy var checkTextField = CustomTextField(text: "Secret Word", cornerRadius: 10)

    private lazy var checkLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Unchecked"
        label.backgroundColor = .systemBlue
        label.textColor = .white
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()

    private lazy var firstButton = CustomButton(title: "FirstButton", backGroundColor: .systemIndigo, target: self, function: #selector(buttonTapped))
    private lazy var secondButton = CustomButton(title: "SecondButton", backGroundColor: .systemMint, target: self, function: #selector(buttonTapped))
    private lazy var checkGuessButton = CustomButton(title: "-> Tap to check <-", backGroundColor: .orange, target: self, function: #selector(checkGuess))


    private lazy var stackView: UIStackView = {
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
        self.setupStackView()
        self.setupGestures()
    }

    private func setupStackView() {
        self.view.addSubview(stackView)
        self.stackView.addArrangedSubview(checkTextField)
        self.stackView.addArrangedSubview(checkLabel)
        self.stackView.addArrangedSubview(checkGuessButton)
        self.stackView.addArrangedSubview(firstButton)
        self.stackView.addArrangedSubview(secondButton)

        NSLayoutConstraint.activate([
            self.stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            self.stackView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5)
        ])
    }

    private func setupGestures() {
        let tupGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        self.view.addGestureRecognizer(tupGesture)
    }

    @objc private func forcedHidingKeyboard() {
        self.view.endEditing(true)
    }

    @objc private func buttonTapped() {
        let postViewController = PostViewController ()
        self.navigationController?.pushViewController(postViewController, animated: true)
    }

    @objc private func checkGuess() {
        if checkTextField.text == "" {
            self.checkLabel.backgroundColor = .systemYellow
            self.checkLabel.text = "Textfield is empty"
        } else {
            let isSecretWordcorrect = self.secretWordCheckerDelegate?.check(word: checkTextField.text) ?? false
            if isSecretWordcorrect {
                self.checkLabel.backgroundColor = .systemGreen
                self.checkLabel.text = "Word is correct"
            } else {
                self.checkLabel.backgroundColor = .systemRed
                self.checkLabel.text = "Wrong word"
            }
        }
    }
}
