//
//  Checker.swift
//  StorageService
//
//  Created by Сергей Топильский on 11.03.2023.
//

import UIKit

final public class Checker: LoginViewControllerDelegateProtocol {

    static public let shared: LoginViewControllerDelegateProtocol = Checker()

        private let login = "HCL"
        private let password = "123"

        private init() { }

        public func check(login: String, password: String) -> Bool {
            return login == self.login && password == self.password
        }
}
