//
//  SceneDelegate.swift
//  Pokedex
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 2/9/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        if let windowScene = scene as? UIWindowScene {

            let window = UIWindow(windowScene: windowScene)
            let dashboard = DashboardViewController()

            let navigation = UINavigationController(rootViewController: dashboard)
            window.rootViewController = navigation

            self.window = window
            window.makeKeyAndVisible()
        }
    }

}

