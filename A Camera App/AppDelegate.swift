//
//  AppDelegate.swift
//  A Camera App
//
//  Created by Akhil Pothana on 2/18/20.
//  Copyright © 2020 AkhilPothana. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let mainVC = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "Main")
        window?.rootViewController = mainVC
        window?.makeKeyAndVisible()
        
        return true
    }

}

