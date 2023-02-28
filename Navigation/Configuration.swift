//
//  Configuration.swift
//  Navigation
//
//  Created by Сергей Топильский on 10.02.2023.
//

import UIKit
import StorageService

enum Configuration {
    static var viewBackgroundColor: UIColor = {
#if DEBUG
        return UIColor.systemPink
#elseif RELEASE
        return UIColor.systemGray6
#endif
    }()

    static var service: UserServiceProtocol = {
#if DEBUG
        return TestUserService(testUser: User(login: "THCL",
                                              fullName: "Test Cat",
                                              avatar: UIImage(named: "testCat")!,
                                              status: "Waiting for testing..."))
#elseif RELEASE
        return CurrentUserService(currentUser: User(login: "HCL",
                                                    fullName: "Hipster Cat",
                                                    avatar: UIImage(named: "defaultavatar")!,
                                                    status: "Waiting for something..."))
#endif
    }()
}
