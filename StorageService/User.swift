//
//  User.swift
//  StorageService
//
//  Created by Сергей Топильский on 17.02.2023.
//

import UIKit

public class User {
    public var login: String
    public var fullName: String
    public var avatar: UIImage
    public var status: String

    public init(login: String, fullName: String, avatar: UIImage, status: String) {
        self.login = login
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}


