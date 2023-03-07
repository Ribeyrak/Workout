//
//  SceneDelegate.swift
//  WorkoutApp
//
//  Created by Evhen Lukhtan on 24.01.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
                options connectionOptions: UIScene.ConnectionOptions) {

        let tabBarController = TabBarController()
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
    }
}

