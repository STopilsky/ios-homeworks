//
//  FeedModel.swift
//  StorageService
//
//  Created by Сергей Топильский on 11.04.2023.
//

import UIKit

public protocol SecretWordCheckerDelegateProtocol {
    func check(word: String?) -> Bool
}

final public class FeedModel: SecretWordCheckerDelegateProtocol {

    private let secretWord = "Secret Word"

    public init() {}

    public func check(word: String?) -> Bool {
        return word == self.secretWord
    }
}
