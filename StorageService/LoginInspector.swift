//
//  LoginInspector.swift
//  StorageService
//
//  Created by Сергей Топильский on 11.03.2023.
//

import Foundation

public struct LoginInspector: LoginViewControllerDelegateProtocol {

    public init () {}

    public func check(login: String, password: String) -> Bool {
        Checker.shared.check(login: login, password: password)
    }
}
