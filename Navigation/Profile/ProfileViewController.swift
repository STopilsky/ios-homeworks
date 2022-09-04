//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Сергей Топильский on 30.08.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView(frame: CGRect(x: 0, y: 88, width: 414, height: 725))
        return profileHeaderView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        self.view.addSubview(self.profileHeaderView)
        self.navigationItem.title = profileHeaderView.profileTitle
    }


    

    

}
