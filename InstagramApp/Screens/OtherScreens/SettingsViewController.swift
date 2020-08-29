//
//  SettingsViewController.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 28.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import UIKit





class SettingsViewController: UIViewController {
  
  // MARK: - Section
  enum Section :Int,CaseIterable {
    case logOut
  }
  
  // MARK: - Views
  
  private let tableView : UITableView = {
    let table = UITableView(frame: .zero, style: .grouped)
    table.backgroundColor = .systemBackground
    return table
  }()
  
  
  
  // MARK: - Services
  
  let authManager: AuthManager! = ServiceLocator.shared.getService()
  
  // MARK: - Lyife cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Settings"
    
    tableView.delegate   = self
    tableView.dataSource = self
    setUpViews()
  }

  
  
  
  
  
  // MARK: - Log Out
  private func logOut() {
    
    let actionSheetController = UIAlertController(title: "Log Out", message: "Are you sure to LogOut", preferredStyle: .actionSheet)
    
    actionSheetController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    
    actionSheetController.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { (action) in
      self.authLogOut()
    }))
    // For Ipad
    actionSheetController.popoverPresentationController?.sourceView = tableView
    actionSheetController.popoverPresentationController?.sourceRect = tableView.bounds
    present(actionSheetController, animated: true, completion: nil)


  }
  
  private func authLogOut() {
    authManager.signOut() {signedOut in
      DispatchQueue.main.async {
        
        if signedOut {
          
          let vc = LoginViewController()
          vc.modalPresentationStyle = .fullScreen
          
          self.present(vc, animated: true) {
            self.navigationController?.popToRootViewController(animated: true)
            self.tabBarController?.selectedIndex = 0
          }
          
          
        } else {
          // errorr handling
        }
      }
     
    }
  }
  
  
}

// MARK: - Set Views
extension SettingsViewController {
  
  func setUpViews() {
    view.addSubview(tableView)
    tableView.fillSuperview()
  }
}

// MARK: - Delegate DataSource
extension SettingsViewController: UITableViewDelegate,UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard
      let section = Section(rawValue: indexPath.section)
    else {return UITableViewCell()}
    
    let cell = UITableViewCell()
    
    switch  section {
    case .logOut:
      cell.textLabel?.text = "Log out"
    }
    
    return cell
  }
  
  
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return Section.allCases.count
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let section = Section(rawValue: indexPath.section) else {return}
        
        switch section {
        case .logOut:
          logOut()
          
        }
  }
  
  

  
  
}
