//
//  InfoViewController.swift
//  Navigation
//
//  Created by Сергей Топильский on 17.08.2022.
//

import UIKit

class InfoViewController: UIViewController {

    private lazy var alertButton = CustomButton(title: "На выбор", backGroundColor: .systemRed, target: self, function: #selector(buttonTapped))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray3
        self.setupAlertButton()
    }

    private func setupAlertButton() {
        self.view.addSubview(self.alertButton)
        self.alertButton.center = self.view.center

        NSLayoutConstraint.activate([
            self.alertButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.alertButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.alertButton.widthAnchor.constraint(equalToConstant: 200),
            self.alertButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc private func buttonTapped() {
        let alertController = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        let removeAction = UIAlertAction(title: "Удалить",style: .destructive) { _ in
            print("Удалено") }
        let hideAction = UIAlertAction(title: "Скрыть", style: .cancel) { _ in
            print("Скрыто") }
        let changeAction = UIAlertAction(title: "Изменить", style: .default) { _ in
            print("Изменено") }

        alertController.addAction(removeAction)
        alertController.addAction(hideAction)
        alertController.addAction(changeAction)

        self.present(alertController, animated: true)
    }
}
