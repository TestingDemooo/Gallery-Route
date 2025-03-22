//
//  AppDelegate.swift
//  routePlanner
//
//  Created by Hema M on 21/03/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()

        self.setupRootVC()
        return true
    }

    // MARK: -  Rootview

    fileprivate func setupRootVC() {
        let nav = UINavigationController(rootViewController: GlobalStoryboard().listVC)
        self.window?.rootViewController = nav
    }
}

