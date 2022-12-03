//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Сергей Топильский on 30.08.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultTableViewCell")
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private let arrayOfPosts: [Post] = [
        Post(author: "Анри Матисс", description: "Танец - год создания 1910", image: "Painting1", likes: 1950, views: 20000),
        Post(author: "Марк Захарович Шагал", description: "Пролетая над городом - год создания 1918", image: "Painting2", likes: 907, views: 1900),
        Post(author: "Винсент Ван Гог", description: "Звездная ночь - год создания 1889", image: "Painting3", likes: 12309, views: 70000),
        Post(author: "Каземир Малевич", description: "Голова крестьянина - год создания 1929", image: "Painting4", likes: 1950, views: 20000),
        Post(author: "Пабло Пикассо", description: "Девочка на шаре - год создания 1905", image: "Painting5", likes: 7, views: 15),
        Post(author: "Сальвадор Дали", description: "Постоянство памяти - год создания 1931", image: "Painting6", likes: 99999, views: 999999),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        self.navigationController?.navigationBar.isHidden = false
        self.view.addSubview(self.tableView)
        self.constraintsActivating()
    }

    private func constraintsActivating () {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }

}

extension ProfileViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfPosts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath)
                as? CustomTableViewCell
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultTableViewCell", for: indexPath)
            return cell
        }
        
        let post = self.arrayOfPosts[indexPath.row]
        cell.setup(author: post.author,
                   description: post.description,
                   image: post.image,
                   likes: post.likes,
                   views: post.views)
        return cell
    }
}



//    private lazy var profileHeaderView: ProfileHeaderView = {
//        let profileHeaderView = ProfileHeaderView(frame: .zero)
//        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
//        return profileHeaderView
//    }()
//
//    private lazy var newButton: UIButton = {
//        let button = UIButton(frame: .zero)
//        button.layer.cornerRadius = 12
//        button.setTitle("New Button", for: .normal)
//        button.backgroundColor = .systemBlue
//        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
//        button.layer.shadowOffset = CGSize(width: 4, height: 4)
//        button.layer.shadowRadius = 4
//        button.layer.shadowOpacity = 0.7
//        button.layer.masksToBounds = false
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.backgroundColor = .systemGray6
//        self.navigationController?.navigationBar.isHidden = false
//        self.view.addSubview(self.profileHeaderView)
//        self.view.addSubview(self.newButton)
//        self.navigationItem.title = profileHeaderView.profileTitle
//
//        let profileHeaderViewConstraints = profileHeaderViewConstraints()
//        let newButtonConstraints = self.newButtonConstraints()
//
//        NSLayoutConstraint.activate(profileHeaderViewConstraints +
//                                    newButtonConstraints)
//    }
//
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//    }
//
//    private func profileHeaderViewConstraints() -> ([NSLayoutConstraint]) {
//        let topConstraint = self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
//        let leadingConstraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
//        let trailingConstraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
//        let heightConstraint = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
//        return ([topConstraint, leadingConstraint, trailingConstraint, heightConstraint])
//    }
//
//    private func newButtonConstraints() -> ([NSLayoutConstraint]) {
//        let bottomConstraint = self.newButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
//        let heightConstraint = self.newButton.heightAnchor.constraint(equalToConstant: 50)
//        let leadingConstraint = self.newButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
//        let trailingConstraint = self.newButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
//        return [leadingConstraint, trailingConstraint, heightConstraint, bottomConstraint]
//    }

//}
