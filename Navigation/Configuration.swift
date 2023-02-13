//
//  Configuration.swift
//  Navigation
//
//  Created by Сергей Топильский on 10.02.2023.
//

import UIKit

enum Configuration {
    static var viewBackgroundColor: UIColor = {
#if DEBUG
        return UIColor.systemPink
#elseif RELEASE
        return UIColor.systemGray6
#endif
    }()
}
