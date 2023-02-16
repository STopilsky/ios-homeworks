//
//  PostViewController.swift
//  Navigation
//
//  Created by Сергей Топильский on 17.08.2022.
//

import UIKit

class PostViewController: UIViewController {

    var titlePost: String = "пост"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemMint
        self.navigationItem.title = self.titlePost
        let infoButton = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(didTapInfoButton))
        navigationItem.rightBarButtonItem = infoButton
        
        }
    
    @objc func didTapInfoButton () {
        let infoViewController = InfoViewController ()
        self.present(infoViewController, animated: true)
    }
}
