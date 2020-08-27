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
    
    let homeViewController = createNavController(HomeViewController(),name: "Home",imageName: "home")
    
 
    
    viewControllers = [

      homeViewController
    ]
    
  }

  
  
  func createNavController(_ viewController: UIViewController, name: String, imageName: String) -> UINavigationController {
    
    viewController.title = name
    viewController.view.backgroundColor = .white
    
    let navigationController = UINavigationController(rootViewController: viewController)
    navigationController.navigationItem.title = name
    navigationController.tabBarItem.title = name
    navigationController.tabBarItem.image = UIImage(named: imageName)
    
    return navigationController
  }
  
  
}
