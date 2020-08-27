//
//  HomeViewCntroller.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 27.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController : UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .yellow
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    checkUserNotAuth()
    
  }

  
}
// MARK: Auth Check
extension HomeViewController {
  
  private func checkUserNotAuth() {
    if Auth.auth().currentUser == nil {
      let loginVC = LoginViewController()
      loginVC.modalPresentationStyle = .fullScreen
      present(loginVC, animated: true, completion: nil)
    }
  }
  
}























// MARK: - SwiftUI provider
import SwiftUI
struct HomeSwiftUIProvider: PreviewProvider {
  static var previews: some View {
    ContainerView().edgesIgnoringSafeArea(.all)
  }
  
  struct ContainerView: UIViewControllerRepresentable {
    
    let someVC = HomeViewController()
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<HomeSwiftUIProvider.ContainerView>) -> HomeViewController {
      return someVC
    }
    
    func updateUIViewController(_ uiViewController: HomeSwiftUIProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<HomeSwiftUIProvider.ContainerView>) {
      
    }
  }
}
