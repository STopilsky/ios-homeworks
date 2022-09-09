//
//  InfoViewController.swift
//  Navigation
//
//  Created by Сергей Топильский on 17.08.2022.
//

import UIKit

class InfoViewController: UIViewController {

    private lazy var alertButton: UIButton = {
        let alertButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        alertButton.backgroundColor = .systemRed
        alertButton.layer.cornerRadius = 20
        alertButton.setTitle("на выбор", for: .normal)
        alertButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        alertButton.addTarget(self, action: #selector(didTupAlertButton), for: .touchUpInside)
        return alertButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray3
        self.view.addSubview(self.alertButton)
        self.alertButton.center = self.view.center
        // Do any additional setup after loading the view.
    }

    @objc private func didTupAlertButton () {
        let alertController = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        let removeAction = UIAlertAction(title: "Удалить", style: .destructive) { _ in
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
