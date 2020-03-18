//
//  AppDelegate.swift
//  UserDefaultsObserver
//
//  Created by Hiromu Nakano on 2020/03/18.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if UserDefaultsRepositories.shared.get() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = storyboard.instantiateInitialViewController()
            (window?.rootViewController as? UINavigationController)?.setViewControllers([
                storyboard.instantiateViewController(withIdentifier: "First"),
                storyboard.instantiateViewController(withIdentifier: "Second"),
                storyboard.instantiateViewController(withIdentifier: "Third"),
            ], animated: false)
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        let isLogin = UserDefaultsRepositories.shared.get()
        UserDefaultsRepositories.shared.setForSettings(isLogin)
    }
}
