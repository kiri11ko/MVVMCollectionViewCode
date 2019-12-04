//
//  AppDelegate.swift
//  MVVMCollectionViewCode
//
//  Created by Кирилл Лукьянов on 03/07/2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let startViewController = StartCollectionViewController()
        window?.rootViewController = startViewController
        window?.makeKeyAndVisible()

        return true
    }

}
