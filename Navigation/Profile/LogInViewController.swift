//
//  LogInViewController.swift
//  Navigation
//
//  Created by Сергей Топильский on 15.11.2022.
//

import UIKit
import StorageService

class LogInViewController: UIViewController {

    var loginDelegate: LoginViewControllerDelegateProtocol?

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

    private lazy var lpStacklView: UIStackView = {
        let lpStacklView = UIStackView()
        lpStacklView.axis = .vertical
        lpStacklView.backgroundColor = .cyan
        lpStacklView.distribution = .fillEqually
        lpStacklView.layer.cornerRadius = 10
        lpStacklView.layer.borderWidth = 1
        lpStacklView.layer.borderColor = UIColor.lightGray.cgColor
        lpStacklView.translatesAutoresizingMaskIntoConstraints = false
        lpStacklView.clipsToBounds = true
        return lpStacklView
    }()

    private lazy var loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.backgroundColor = .systemGray6
//        loginTextField.placeholder = "Email or phone"
        loginTextField.text = "HCL"
        loginTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height:0))
        loginTextField.leftViewMode = .always
        loginTextField.borderStyle = .line
        loginTextField.layer.borderColor = UIColor.lightGray.cgColor
        loginTextField.layer.borderWidth = 1
        loginTextField.keyboardType = .emailAddress
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        return loginTextField
    }()

    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.backgroundColor = .systemGray6
//        passwordTextField.placeholder = "Password"
        passwordTextField.text = "123"
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height:0))
        passwordTextField.leftViewMode = .always
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
        logInButton.addTarget(self, action: #selector(didTupLoginButton), for: .touchUpInside)
        return logInButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupGestures()
        self.addingSubViews()
        self.constraintsActivating()
    }

    private func addingSubViews() {
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.logoImage)
        self.scrollView.addSubview(self.lpStacklView)
        self.lpStacklView.addArrangedSubview(self.loginTextField)
        self.lpStacklView.addArrangedSubview(self.passwordTextField)
        self.scrollView.addSubview(self.logInButton)

    }

    private func constraintsActivating() {
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),

            self.logoImage.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            self.logoImage.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 120),
            self.logoImage.heightAnchor.constraint(equalToConstant: 100),
            self.logoImage.widthAnchor.constraint(equalTo: self.logoImage.heightAnchor),

            self.lpStacklView.topAnchor.constraint(equalTo: self.logoImage.bottomAnchor, constant: 120),
            self.lpStacklView.heightAnchor.constraint(equalToConstant: 100),
            self.lpStacklView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.lpStacklView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,  constant: -16),

            self.logInButton.topAnchor.constraint(equalTo: self.lpStacklView.bottomAnchor, constant: 16),
            self.logInButton.heightAnchor.constraint(equalToConstant: 50),
            self.logInButton.leadingAnchor.constraint(equalTo: self.lpStacklView.leadingAnchor),
            self.logInButton.trailingAnchor.constraint(equalTo: self.lpStacklView.trailingAnchor)
        ])
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
        self.navigationController?.navigationBar.isHidden = true
    }

    private func setupGestures() {
        let tupGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        self.view.addGestureRecognizer(tupGesture)
    }

    @objc private func didShowKeyboard(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboearHeight = keyboardRectangle.height

            let buttonBottomPointY = self.logInButton.frame.maxY
            let keyboardTopPointY = self.view.frame.height - keyboearHeight

            let yOffset = buttonBottomPointY > keyboardTopPointY
            ? buttonBottomPointY - keyboardTopPointY + 16
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

    @objc private func didTupLoginButton() {
        let isUserDataCorrect = self.loginDelegate?.check(
            login: self.loginTextField.text ?? "too short name",
            password: self.passwordTextField.text ?? "to short pass") ?? false
        
        if isUserDataCorrect {
            let profileViewController = ProfileViewController(userData: Configuration.user)
            self.navigationController?.pushViewController(profileViewController, animated: true)
        }

        else {
            let alertController = UIAlertController(title: "Неверная пара логин / пароль",
                                                    message: "Убедитесь, что данные указаны корректно",
                                                    preferredStyle: .alert)

            let closeAction = UIAlertAction(title: "Повторить", style: .default) {_ in
                alertController.dismiss(animated: true)
            }
            alertController.addAction(closeAction)
            
            self.present(alertController, animated: true)
        }
    }
}
