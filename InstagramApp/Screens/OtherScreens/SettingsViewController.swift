//
//  SettingsViewController.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 28.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import UIKit
import SafariServices


struct SettingCellModel {
  var label   : String
  var handler : (() -> Void)
}

class SettingsViewController: UIViewController {
  

  
  // MARK: - Views
  
  private lazy var  tableView : UITableView = {
    let table = UITableView(frame: .zero, style: .grouped)
    table.backgroundColor = .systemBackground
    table.delegate        = self
    table.dataSource      = self
    return table
  }()
  
  
  // MARK: - Data
  
  
  var data : [[SettingCellModel]] = []
  
  
  
  // MARK: - Services
  
  let authManager: AuthManager! = ServiceLocator.shared.getService()
  
  // MARK: - Lyife cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Settings"
    
    setUpViews()
    configureModels()
  }
  
  // MARK: - Configure Models
  
  private func configureModels() {
    
    data.append(
      [
        SettingCellModel.init(label: "Edit Profile", handler: {[weak self] in
          self?.didTapEditProfile()
      }),
        SettingCellModel.init(label: "Invite Friedns", handler: {[weak self] in
          self?.didTapInviteFriedns()
        }),
        SettingCellModel.init(label: "Save Oroginal Post", handler: {[weak self] in
          self?.saveOriginalPost()
        })
      ]
    )
    
    data.append(
      [
        SettingCellModel.init(label: "Terms of privacy", handler: {[weak self] in
          self?.openUrl(.terms)
        }),
        SettingCellModel.init(label: "Privacy Policy", handler: {
          [weak self] in
          self?.openUrl(.privacy)
        }),
        SettingCellModel.init(label: "Help / Feedback", handler: {
          [weak self] in
          self?.openUrl(.help)
        })
      ]
    )
    
    data.append([
      SettingCellModel.init(label: "Log out", handler: {[weak self] in
        self?.logOut()
      }),
    ])
    
    
  }
  
  
  

  
  
  

  
  
  
  
}

// MARK: - Signals
extension SettingsViewController {
  
  
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
  
  enum SettingsURLType {
    case terms,privacy,help
  }
  
  private func openUrl(_ type : SettingsURLType) {
    let urlString: String
    switch type {
    case .help:    urlString = "https://help.instagram.com/581066165581870"
    case .privacy: urlString = "https://help.instagram.com/196883487377501"
    case .terms:   urlString = "https://help.instagram.com"
    
    }
    
    guard let url = URL(string: urlString) else {return}
    let vc = SFSafariViewController(url: url)
    present(vc, animated: true, completion: nil)
  }
  
  // MARK: - Edit Profile
  private func didTapEditProfile() {
    let vc = EditProfileViewController()
    let navVc = UINavigationController(rootViewController: vc)
    present(navVc, animated: true, completion: nil)
  }
  // MARK: - Invite Friends
  private func didTapInviteFriedns() {
  
  }
  
  // MARK: - Save Priginal Post
  private func saveOriginalPost() {
    
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
    data[section].count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    
    let cell = UITableViewCell()
    cell.accessoryType   = .disclosureIndicator
    cell.textLabel?.text = data[indexPath.section][indexPath.row].label

    
    return cell
  }
  
  
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    
      data[indexPath.section][indexPath.row].handler()

  }
  
  

  
  
}
