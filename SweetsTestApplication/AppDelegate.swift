//
//  AppDelegate.swift
//  SweetsTestApplication
//
//  Created by Laurin Brandner on 20/05/15.
//  Copyright (c) 2015 Laurin Brandner. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        
        return true
    }


}

