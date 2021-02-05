//
//  SceneDelegate.swift
//  WeatherForecast2.0
//
//  Created by Роман Мироненко on 25.01.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.titleTextAttributes = [
                .foregroundColor: UIColor.white
            ]
            navBarAppearance.largeTitleTextAttributes = [
                .foregroundColor: UIColor.white
            ]
            
            navBarAppearance.buttonAppearance.normal.titleTextAttributes = [
                .foregroundColor: UIColor.white,
            ]
            let mainViewModel = MainViewModel()
            let viewController = MainViewController(mainViewModel: mainViewModel)
            mainViewModel.mainViewController = viewController
            let window = UIWindow(windowScene: windowScene)
            let navigation = UINavigationController(rootViewController: viewController)
            window.rootViewController = navigation
            navigation.navigationBar.standardAppearance = navBarAppearance
            navigation.navigationBar.scrollEdgeAppearance = navBarAppearance
            self.window = window
            window.makeKeyAndVisible()
        }
        
    }
}

