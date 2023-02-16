//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Сергей Топильский on 30.08.2022.
//

import UIKit
import StorageService
import SnapKit
import iOSIntPackage

class ProfileViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "ProfileHeaderView")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Configuration.viewBackgroundColor
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "Post"
        self.view.addSubview(self.tableView)
        self.setupConstraints()
    }


    private func setupConstraints() {
        self.tableView.snp.makeConstraints {make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }

    @objc private func didTupPhotosCell() {
        let photosViewController = PostViewController()
        self.navigationController?.pushViewController(photosViewController, animated: true)
    }

}

extension ProfileViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfPosts.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.row {

        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath) as! PhotosTableViewCell
            return cell

        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! PostTableViewCell

            let post = arrayOfPosts[indexPath.row - 1]
            cell.setup(author: post.author,
                       description: post.description,
                       image: post.image,
                       likes: post.likes,
                       views: post.views)
            return cell
        }
    }
}

extension ProfileViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProfileHeaderView") as! ProfileHeaderView
        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 200 : 0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let photosViewController = PhotosViewController()
            self.navigationController?.pushViewController(photosViewController, animated: true)
        }
    }
}
