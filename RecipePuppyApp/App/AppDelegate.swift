//
//  AppDelegate.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10/6/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootNavigationController = RecipesListRouter.setupModule()
        self.window?.rootViewController = rootNavigationController
        self.window?.makeKeyAndVisible()
        return true
    }

}

