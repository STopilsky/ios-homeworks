//
//  LogInViewController.swift
//  Navigation
//
//  Created by Сергей Топильский on 15.11.2022.
//

import UIKit

class LogInViewController: UIViewController {

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var logoImage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "logo")
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        return logoImage
    }()


    private lazy var loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.backgroundColor = .systemGray6
        loginTextField.placeholder = "Email or phone"
        loginTextField.borderStyle = .roundedRect
        loginTextField.keyboardType = .emailAddress
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        return loginTextField
    }()

    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.placeholder = "Password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        return passwordTextField
    }()

    private lazy var logInButton: UIButton = {
        let logInButton = UIButton()
        logInButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        logInButton.layer.cornerRadius = 10
        logInButton.clipsToBounds = true
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        return logInButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupGestures()
        self.navigationController?.navigationBar.isHidden = true
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.logoImage)
        self.scrollView.addSubview(self.loginTextField)
        self.scrollView.addSubview(self.passwordTextField)
        self.scrollView.addSubview(self.logInButton)

        let scrollViewConstraints = self.scrollViewConstraints()
        let logoImageConstraints = self.logoImageConstraints()
        let loginTextFieldConstraints = self.loginTextFieldConstraints()
        let passwordTextFieldConstraints = self.passwordTextFieldConstraints()
        let logInButtonConstraints = self.logInButtonConstraints()

        NSLayoutConstraint.activate(scrollViewConstraints +
                                    logoImageConstraints +
                                    loginTextFieldConstraints +
                                    passwordTextFieldConstraints +
                                    logInButtonConstraints)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didShowKeyboard(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didHideKeyboard(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }

    private func setupGestures() {
        let tupGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        self.view.addGestureRecognizer(tupGesture)
    }

    private func scrollViewConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let bottomConstraint = self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let leadingConstraint = self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        return [topConstraint, bottomConstraint, leadingConstraint, trailingConstraint]
    }

    private func logoImageConstraints() -> [NSLayoutConstraint] {
        let centerConstraint = self.logoImage.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor)
        let topConstraint = self.logoImage.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 120)
        let heightConstraint = self.logoImage.heightAnchor.constraint(equalToConstant: 100)
        let widthConstraint = self.logoImage.widthAnchor.constraint(equalTo: self.logoImage.heightAnchor)
        return [centerConstraint, topConstraint, heightConstraint, widthConstraint]
    }

    private func loginTextFieldConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.loginTextField.topAnchor.constraint(equalTo: self.logoImage.bottomAnchor, constant: 120)
        let heightConstraint = self.loginTextField.heightAnchor.constraint(equalToConstant: 50)
        let leadingConstraint = self.loginTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
        let trailingConstraint = self.loginTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,  constant: -16)
        return [topConstraint, heightConstraint, leadingConstraint, trailingConstraint]
    }

    private func passwordTextFieldConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.passwordTextField.topAnchor.constraint(equalTo: self.loginTextField.bottomAnchor)
        let heightConstraint = self.passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        let leadingConstraint = self.passwordTextField.leadingAnchor.constraint(equalTo: self.loginTextField.leadingAnchor)
        let trailingConstraint = self.passwordTextField.trailingAnchor.constraint(equalTo: self.loginTextField.trailingAnchor)
        return [topConstraint, heightConstraint, leadingConstraint, trailingConstraint]
    }

    private func logInButtonConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.logInButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 16)
        let heightConstraint = self.logInButton.heightAnchor.constraint(equalToConstant: 50)
        let leadingConstraint = self.logInButton.leadingAnchor.constraint(equalTo: self.loginTextField.leadingAnchor)
        let trailingConstraint = self.logInButton.trailingAnchor.constraint(equalTo: self.loginTextField.trailingAnchor)
        return [topConstraint, heightConstraint, leadingConstraint, trailingConstraint]
    }

    @objc private func didShowKeyboard(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboearHeight = keyboardRectangle.height

            let buttonBottomPointY = self.logInButton.frame.maxY
            let keyboardTopPointY = self.view.frame.height - keyboearHeight

            let yOffset = buttonBottomPointY > keyboardTopPointY
            ? buttonBottomPointY - keyboardTopPointY + 150
            : 0

            self.scrollView.contentOffset = CGPoint(x: 0, y: yOffset)
        }
    }

    @objc private func didHideKeyboard(_ notification: Notification) {
        self.forcedHidingKeyboard()
    }
    @objc private func forcedHidingKeyboard() {
        self.view.endEditing(true)
        self.scrollView.setContentOffset(.zero, animated: true)
    }

}
