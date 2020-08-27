//
//  AppDelegate.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 27.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
  
    
    root()
    FirebaseApp.configure()
    
    return true
  }
  
  private func initServiceLocator() {
    let locator = ServiceLocator.shared
    
    locator.addService(service: DatabaseManger.shared)
    locator.addService(service: AuthManager.shared)
  }
  
  private func root() {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = TabController()
    window?.makeKeyAndVisible()
  }


}

