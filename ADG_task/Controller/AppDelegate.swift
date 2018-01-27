//
//  AppDelegate.swift
//  ADG_task
//
//  Created by Sarvad shetty on 1/11/18.
//  Copyright © 2018 Sarvad shetty. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UINavigationBar.appearance().barTintColor = UIColor(displayP3Red: 241.0/255.0, green: 169.0/255.0, blue: 160.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().tintColor = UIColor.white
        if let barFont = UIFont(name: "Avenir Next", size: 24.0){
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white,NSAttributedStringKey.font:barFont]
        }
        UIApplication.shared.statusBarStyle = .lightContent
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
      
        
    }
 
}

