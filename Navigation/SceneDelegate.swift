//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Сергей Топильский on 17.08.2022.
//

import UIKit
import StorageService

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = createTabBarController()
        self.window?.makeKeyAndVisible()

        func createFeedViewController() -> UINavigationController {
            let feedViewController = FeedViewController()
            feedViewController.secretWordCheckerDelegate = FeedModel()
            feedViewController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "newspaper"), tag: 0)
            return UINavigationController(rootViewController: feedViewController)
        }

        func createLogInViewController() -> UINavigationController {
            let logInViewController = LogInViewController()
            let myLoginfactory = MyLoginFactory()
            logInViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 1)
            logInViewController.loginDelegate = myLoginfactory.makeLoginInspector()
            return UINavigationController(rootViewController: logInViewController)
        }

        func createTabBarController() -> UITabBarController {
            let tabBarController = UITabBarController()
            UITabBar.appearance().backgroundColor = .systemGray6
            tabBarController.viewControllers = [createFeedViewController(), createLogInViewController()]
            return tabBarController
        }
    }
}

