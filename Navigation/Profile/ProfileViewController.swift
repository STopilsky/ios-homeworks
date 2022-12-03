//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Сергей Топильский on 30.08.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView(frame: .zero)
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        return profileHeaderView
    }()

    private lazy var newButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = 12
        button.setTitle("New Button", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.masksToBounds = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        self.navigationController?.navigationBar.isHidden = false
        self.view.addSubview(self.profileHeaderView)
        self.view.addSubview(self.newButton)
        self.navigationItem.title = profileHeaderView.profileTitle

        let profileHeaderViewConstraints = profileHeaderViewConstraints()
        let newButtonConstraints = self.newButtonConstraints()

        NSLayoutConstraint.activate(profileHeaderViewConstraints +
                                    newButtonConstraints)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }

    private func profileHeaderViewConstraints() -> ([NSLayoutConstraint]) {
        let topConstraint = self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let heightConstraint = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        return ([topConstraint, leadingConstraint, trailingConstraint, heightConstraint])
    }

    private func newButtonConstraints() -> ([NSLayoutConstraint]) {
        let bottomConstraint = self.newButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        let heightConstraint = self.newButton.heightAnchor.constraint(equalToConstant: 50)
        let leadingConstraint = self.newButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
        let trailingConstraint = self.newButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        return [leadingConstraint, trailingConstraint, heightConstraint, bottomConstraint]
    }

}
