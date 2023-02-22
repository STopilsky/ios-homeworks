//
//  TestUserService.swift
//  StorageService
//
//  Created by Сергей Топильский on 21.02.2023.
//

import UIKit

public class TestUserService: UserServiceProtocol {

    public var testUser: User

    public init(testUser: User) {
        self.testUser = testUser
    }

    public func userVerification(login: String) -> User? {
        var correctUser: User? = nil
        if login == self.testUser.login {
            correctUser = testUser
        }
        return correctUser
    }
}
