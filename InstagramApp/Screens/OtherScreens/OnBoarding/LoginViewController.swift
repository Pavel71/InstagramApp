//
//  LoginViewController.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 27.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController {
  
  
  struct Constants {
    static let cornerRadius    : CGFloat = 8.0
    static let textFieldHeight : CGFloat = 52
  }
  
  // MARK: - Views
  
  private lazy var loginTextfield: UITextField = {
    let tx = UITextField()
    tx.placeholder   = "Username or Email..."
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
  private lazy var loginButton: UIButton = {
    let b = UIButton(type: .system)
    b.setTitle("Log in", for: .normal)
    b.layer.masksToBounds = true
    b.layer.cornerRadius  = Constants.cornerRadius
    b.backgroundColor     = .systemBlue
    b.setTitleColor(.white, for: .normal)
    return b
  }()
  private lazy var termsButton: UIButton = {
    let b = UIButton(type: .system)
    b.setTitle("Terms of served", for: .normal)
    b.setTitleColor(.secondaryLabel, for: .normal)
    return b
  }()
  private lazy var privacyButton: UIButton = {
    let b = UIButton(type: .system)
    b.setTitle("Privacy and Policy", for: .normal)
    b.setTitleColor(.secondaryLabel, for: .normal)
    return b
  }()
  private lazy var createAccountButton: UIButton = {
    let b = UIButton(type: .system)
    b.setTitle("New user? Create account...", for: .normal)
    b.setTitleColor(.label, for: .normal)
    return b
  }()
  private lazy var headerView: UIView = {
    let view = UIView()
    view.backgroundColor = .red
    view.clipsToBounds   = true
    view.addSubview(UIImageView(image: UIImage(named: "gradient")))
    return view
  }()
  
  
  // MARK: - Srvices
  
  let authManager: AuthManager! = ServiceLocator.shared.getService()
  
  // MARK: - Lyfecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    loginTextfield.delegate    = self
    passwordTextfield.delegate = self
    
    loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    createAccountButton.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)
    termsButton.addTarget(self, action: #selector(didTapTermsButton), for: .touchUpInside)
    privacyButton.addTarget(self, action: #selector(didTapPrivacyButton), for: .touchUpInside)
    
    view.backgroundColor = .systemBackground
    addSubViews()
    layoutViews()
    
    
    configureHeaderView()
  }
  
  // MARK: - Layouts
  private func layoutViews() {
    headerView.frame = .init(
      x      : 0,
      y      : view.safeAreaInsets.top,
      width  : view.width,
      height : view.height / 3)
    
    loginTextfield.frame = .init(
      x      : 25,
      y      : headerView.bottom + 50,
      width  : view.width - 50,
      height : Constants.textFieldHeight)
    passwordTextfield.frame = .init(
      x      : 25,
      y      : loginTextfield.bottom + 10,
      width  : view.width - 50,
      height : Constants.textFieldHeight)
    loginButton.frame = .init(
      x      : 25,
      y      : passwordTextfield.bottom + 10,
      width  : view.width - 50,
      height : Constants.textFieldHeight)
    createAccountButton.frame = .init(
      x      : 25,
      y      : loginButton.bottom + 10,
      width  : view.width - 50,
      height : Constants.textFieldHeight)
    
    termsButton.frame         = .init(
      x      : 10,
      y     : view.height - view.safeAreaInsets.bottom - 120,
      width  : view.width - 20,
      height : 50)
    privacyButton.frame         = .init(
      x      : 10,
      y      : view.height - view.safeAreaInsets.bottom - 60,
      width  : view.width - 20,
      height : 50)
    
    
  }
  
  private func configureHeaderView() {
    
    guard headerView.subviews.count == 1 else {return}
    
    let backroundView   = headerView.subviews.first!
    backroundView.frame = headerView.bounds
    
    let logoImageView = UIImageView(image: UIImage(named: "text"))
    headerView.addSubview(logoImageView)
    logoImageView.contentMode = .scaleAspectFit
    logoImageView.frame = .init(
      x: headerView.width / 4,
      y: headerView.safeAreaInsets.top,
      width: headerView.width / 2,
      height: headerView.height - headerView.safeAreaInsets.top)
    
  }
  
  private func addSubViews() {
    view.addSubview(loginTextfield)
    view.addSubview(passwordTextfield)
    view.addSubview(loginButton)
    view.addSubview(termsButton)
    view.addSubview(privacyButton)
    view.addSubview(createAccountButton)
    view.addSubview(headerView)
  }
  
  // MARK: - Signals
  
  @objc private func didTapLoginButton(){
    print("Login button")
    passwordTextfield.resignFirstResponder()
    loginTextfield.resignFirstResponder()
    
    guard
      let login    = loginTextfield.text,
      login.isEmpty    == false,
      let password = passwordTextfield.text,
      password.isEmpty == false
    else {return}
    
    // Should Impleneted Login Functionality
    
    if  login.contains("@"),login.contains(".") {
      
      authManager.loginUser(userName: nil, email: login, password: password) {[weak self] (isSucces) in
        
        DispatchQueue.main.async {
          if isSucces {
            self?.dismiss(animated: true, completion: nil)
          } else {
            self?.showAlert(message: "Can't login")
          }
        }
        
       
        
      }
      
      
    } else { // User Name USer
      
    }
    
  }
  
  @objc private func didTapTermsButton(){
    guard let url = URL(string: "https://help.instagram.com/581066165581870") else {return}
    let vc = SFSafariViewController(url: url)
    present(vc, animated: true, completion: nil)
  }
  
  @objc private func didTapPrivacyButton(){
    guard let url = URL(string: "https://help.instagram.com/196883487377501") else {return}
    let vc = SFSafariViewController(url: url)
    present(vc, animated: true, completion: nil)
  }
  
  @objc private func didTapCreateAccountButton(){
    let vc = RegisterViewController()
    vc.title = "Create new account"
    present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
  }
  
  
  
  
  
}

// MARK: TextField Delegate
extension LoginViewController : UITextFieldDelegate{
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == loginTextfield {
      passwordTextfield.becomeFirstResponder()
    } else if textField == passwordTextfield {
      didTapLoginButton()
    }
    
    return true
  }
}




// MARK: - SwiftUI provider
import SwiftUI
struct LoginVCSwiftUIProvider: PreviewProvider {
  static var previews: some View {
    ContainerView().edgesIgnoringSafeArea(.all)
  }
  
  struct ContainerView: UIViewControllerRepresentable {
    
    let someVC = LoginViewController()
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<LoginVCSwiftUIProvider.ContainerView>) -> LoginViewController {
      return someVC
    }
    
    func updateUIViewController(_ uiViewController: LoginVCSwiftUIProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<LoginVCSwiftUIProvider.ContainerView>) {
      
    }
  }
}
