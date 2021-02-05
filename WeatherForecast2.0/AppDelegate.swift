//
//  AppDelegate.swift
//  WeatherForecast2.0
//
//  Created by Роман Мироненко on 25.01.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
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
        let navigation = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigation
        navigation.navigationBar.standardAppearance = navBarAppearance
        navigation.navigationBar.scrollEdgeAppearance = navBarAppearance
        window?.makeKeyAndVisible()
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}

