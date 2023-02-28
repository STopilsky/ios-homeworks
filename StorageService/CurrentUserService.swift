//
//  File.swift
//  StorageService
//
//  Created by Сергей Топильский on 17.02.2023.
//

import UIKit

public class CurrentUserService: UserServiceProtocol {
    public var currentUser: User
    
    public init(currentUser: User) {
        self.currentUser = currentUser
    }
    
    public func userVerification(login: String) -> User? {
        login == self.currentUser.login ? currentUser : nil
    }
}
