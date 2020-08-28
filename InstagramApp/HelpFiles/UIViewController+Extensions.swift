//
//  UIViewController+Extensions.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 28.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import UIKit


extension UIViewController {
  func showAlert(title: String = "Что-то пошло не так", message: String) {
    
    let alertControlelr = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
    
    alertControlelr.addAction(alertAction)
    present(alertControlelr, animated: true, completion: nil)
  }
}
