//
//  LoginViewControllerDelegateProtocol.swift
//  StorageService
//
//  Created by Сергей Топильский on 11.03.2023.
//

import UIKit

public protocol LoginViewControllerDelegateProtocol {
    func check(login: String, password: String) -> Bool
}
