//
//  RegisterViewController.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 27.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import UIKit

// Задача сверстать экран с несколькими View для регистрации!

class RegisterViewController: UIViewController {
  
  struct Constants {
    static let cornerRadius             : CGFloat = 8.0
    static let textFieldHeight          : CGFloat = 52
    static let spaceBetweenTextFields   : CGFloat = 10

  }
  
  // MARK: - Views
  
  private lazy var userNameTextfield: UITextField = {
    let tx = UITextField()
    tx.placeholder   = "Username..."
    tx.returnKeyType = .next
    tx.leftViewMode  = .always
    tx.leftView      = UIView(frame: .init(x: 0, y: 0, width: 10, height: 0))
    tx.autocorrectionType  = .no
    tx.autocorrectionType  = .no
    tx.layer.masksToBounds = true
    tx.layer.cornerRadius  = Constants.cornerRadius
    tx.backgroundColor     = .secondarySystemBackground
    tx.layer.borderWidth   = 1.0
    tx.layer.borderColor   = UIColor.secondaryLabel.cgColor
    return tx
  }()
   
   private lazy var emailTextfield: UITextField = {
     let tx = UITextField()
     tx.placeholder   = "Email..."
     tx.returnKeyType = .next
     tx.leftViewMode  = .always
     tx.leftView      = UIView(frame: .init(x: 0, y: 0, width: 10, height: 0))
     tx.autocorrectionType  = .no
     tx.autocorrectionType  = .no
     tx.layer.masksToBounds = true
     tx.layer.cornerRadius  = Constants.cornerRadius
     tx.backgroundColor     = .secondarySystemBackground
     tx.layer.borderWidth   = 1.0
     tx.layer.borderColor   = UIColor.secondaryLabel.cgColor
     return tx
   }()
   private lazy var passwordTextfield: UITextField = {
     let tx = UITextField()
     tx.isSecureTextEntry = true
     tx.placeholder   = "Password..."
     tx.returnKeyType = .continue
     tx.leftViewMode  = .always
     tx.leftView      = UIView(frame: .init(x: 0, y: 0, width: 10, height: 0))
     tx.autocorrectionType  = .no
     tx.autocorrectionType  = .no
     tx.layer.masksToBounds = true
     tx.layer.cornerRadius  = Constants.cornerRadius
     tx.backgroundColor     = .secondarySystemBackground
     tx.layer.borderWidth   = 1.0
     tx.layer.borderColor   = UIColor.secondaryLabel.cgColor
     return tx
   }()
   private lazy var registerButton: UIButton = {
     let b = UIButton(type: .system)
     b.setTitle("Registration", for: .normal)
     b.layer.masksToBounds = true
     b.layer.cornerRadius  = Constants.cornerRadius
     b.backgroundColor     = .systemGreen
     b.setTitleColor(.white, for: .normal)
     return b
   }()
  
 
  
  // MARK: - Stacks
  
  private lazy var stack : UIStackView = {
    let stack = UIStackView(arrangedSubviews: [
      userNameTextfield,
      emailTextfield,
      passwordTextfield,
      registerButton
    ])
    stack.distribution = .fillEqually
    stack.axis         = .vertical
    stack.spacing      = Constants.spaceBetweenTextFields
    return stack
  }()
  
  // MARK: - Services
   
   private var authManager : AuthManager! = ServiceLocator.shared.getService()
  
  
  
  
  // MARK: - Lyfe Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = .systemBackground
      addViews()
      
      userNameTextfield.delegate = self
         
      emailTextfield.delegate    = self
      passwordTextfield.delegate = self
         
      registerButton.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
    }
  
  @objc private func didTapRegisterButton() {
    emailTextfield.resignFirstResponder()
    userNameTextfield.resignFirstResponder()
    passwordTextfield.resignFirstResponder()
    
    
    guard
      let email        = emailTextfield.text,
      email.isEmpty    == false,
      let userName     = userNameTextfield.text,
      userName.isEmpty == false,
      let password     = passwordTextfield.text,
      password.isEmpty == false
    else {return}
    
    authManager.registerNewUser(userName: userName, email: email, password: password) {[weak self] isSucces in
      DispatchQueue.main.async {
         if isSucces {
           self?.dismiss(animated: true, completion: nil)
         } else {
           self?.showAlert(message: "User didn't created")
         }
      }
      
    }
    
  }

}

// MARK: - TextField Delegate
extension RegisterViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == userNameTextfield {
      emailTextfield.becomeFirstResponder()
    } else if textField == emailTextfield {
      passwordTextfield.becomeFirstResponder()
      
    } else {
      didTapRegisterButton()
    }
    
    return true
  }
}

// MARK: - Layout
extension RegisterViewController {
  func addViews() {
    view.addSubview(stack)
    stack.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 50, left: 10, bottom: 0, right: 10),size: .init(width: 0, height: Constants.textFieldHeight * 4 + Constants.spaceBetweenTextFields * 4))
  }
}
