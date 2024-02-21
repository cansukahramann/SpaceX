//
//  SceneDelegate.swift
//  SapceX_Cansu
//
//  Created by Cansu Kahraman on 1.02.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let rootViewController = MainViewController()
        window?.rootViewController = UINavigationController(rootViewController: rootViewController)
        window?.makeKeyAndVisible()
        
    }

}

