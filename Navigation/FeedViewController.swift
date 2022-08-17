//
//  FeedViewController.swift
//  Navigation
//
//  Created by Сергей Топильский on 17.08.2022.
//

import UIKit

class FeedViewController: UIViewController {

    var post = Post(title: "Это мой пост")

    private lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 20
        button.setTitle("Пост", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(didTupButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        self.view.addSubview(self.button)
        self.button.center = self.view.center
    }

    @objc private func didTupButton () {
        let postViewController = PostViewController ()
        postViewController.titlePost = post.title
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
