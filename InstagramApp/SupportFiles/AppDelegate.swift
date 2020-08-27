//
//  AppDelegate.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 27.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
  
    
    root()
    
    return true
  }
  
  private func root() {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = HomeViewController()
    window?.makeKeyAndVisible()
  }


}

