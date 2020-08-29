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
  
  // MARK: - Views
  
  
  private lazy var tableView: UITableView = {
    let table = UITableView(frame: .zero, style: .plain)
    table.delegate   = self
    table.dataSource = self
    table.register(IGFeedPostTableViewCell.self, forCellReuseIdentifier: IGFeedPostTableViewCell.cellID)
    return table
  }()
  
  
  // MARK: - Layfe Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBackground
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    setUpViews()
    checkUserNotAuth()
    
  }
  
  private func setUpViews() {
    view.addSubview(tableView)
    tableView.fillSuperview()
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




// MARK: - Table Delegate DataSource
extension HomeViewController: UITableViewDelegate,UITableViewDataSource {
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostTableViewCell.cellID, for: indexPath) as! IGFeedPostTableViewCell
    
    return cell
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
