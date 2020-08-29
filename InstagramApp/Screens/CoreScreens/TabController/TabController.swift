//
//  TabController.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 27.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import UIKit

class TabController: UITabBarController {
  
  override func viewDidLoad() {
    
    let homeViewController = createNavController(HomeViewController(),name: "Home",imageName: "house")
    let exploreVC          = createNavController(ExploreViewController(), name: "Explore", imageName: "magnifyingglass")
    let cameraVC           = createNavController(CameraViewController(), name: "Camera", imageName: "plus")
    let profileVC          = createNavController(ProfileViewController(), name: "Profile", imageName: "person")
    let notificationVC     = createNavController(NotificationViewController(), name: "Notification", imageName: "heart")
 
    
    viewControllers = [

      homeViewController,
      exploreVC,
      cameraVC,
      notificationVC,
      profileVC
      
    ]

    
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    UITabBar.appearance().tintColor = .systemBlue
        
  }

  
  
  func createNavController(_ viewController: UIViewController, name: String, imageName: String) -> UINavigationController {
    
    viewController.title = name
//    viewController.view.backgroundColor = .white
    
    let navigationController = UINavigationController(rootViewController: viewController)
    navigationController.navigationItem.title = name
    navigationController.tabBarItem.title = name
    
    navigationController.tabBarItem.image =  UIImage(systemName: imageName)
    
    return navigationController
  }
  
  
}
