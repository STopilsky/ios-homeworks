//
//  File.swift
//  StorageService
//
//  Created by Сергей Топильский on 17.02.2023.
//

import UIKit

public protocol UserServiceProtocol: AnyObject {
    func userVerification (login: String) -> User?
}
