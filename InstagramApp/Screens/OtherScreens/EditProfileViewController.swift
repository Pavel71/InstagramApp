//
//  EditProfileViewController.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 29.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      title = "Edit Profile"
      view.backgroundColor = .systemBackground
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    configureNavBar()
  }
    
  
 

}

// MARK: Configure Nav Bar
extension EditProfileViewController {
  private func configureNavBar() {
     navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(handleSaveButton))
     navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(handleCancelButton))
   }
   
   
   @objc private func handleSaveButton() {
     
   }
   @objc private func handleCancelButton() {
      
    }
  
  @objc private func didTapChangeProfielPicture() {
    let actionSheetController = UIAlertController(title: "Profile Picture", message: "Change Profile Picture", preferredStyle: .actionSheet)

    actionSheetController.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: nil))

    actionSheetController.addAction(UIAlertAction(title: "Choose From Library", style: .default, handler: { (action) in
      
    }))
    actionSheetController.addAction(UIAlertAction(title: "Cancel", style: .cancel,handler: nil))
    
    
    // For Ipad
    actionSheetController.popoverPresentationController?.sourceView = self.view
    actionSheetController.popoverPresentationController?.sourceRect = self.view.bounds
    present(actionSheetController, animated: true, completion: nil)
  }
}
