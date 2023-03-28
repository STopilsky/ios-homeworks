//
//  LoginFactory.swift
//  StorageService
//
//  Created by Сергей Топильский on 18.03.2023.
//

import Foundation

public protocol LoginFactoryProtocol {
    func makeLoginInspector() -> LoginInspector
}
