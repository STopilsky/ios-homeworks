//
//  MyLoginFactory.swift
//  StorageService
//
//  Created by Сергей Топильский on 18.03.2023.
//

import UIKit

public struct MyLoginFactory: LoginFactoryProtocol {

    public init () {}

    public func makeLoginInspector() -> LoginInspector {
        return LoginInspector()
    }
}
