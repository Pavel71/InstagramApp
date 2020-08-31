//
//  EditProfileViewController.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 29.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import UIKit

struct EditProfileFormModel {
  let label       : String
  let placeHolder : String
  var value       : String?
}

class EditProfileViewController: UIViewController {
  
  
  // MARK: Views
  
  
  private lazy var tableView : UITableView = {
    let table = UITableView(frame: .zero, style: .grouped)
    table.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    
    table.delegate   = self
    table.dataSource = self
    return table
  }()
  
  private lazy var tableHeaderView : UIView = {
    let v = UIView(frame: .init(x: 0, y: 0, width: view.width, height: view.height / 3))
    v.backgroundColor = .systemRed
    return v
  }()
  private lazy var profileButtonSize = tableHeaderView.height / 1.8
  private lazy var profileButton: UIButton = {
    let b = UIButton(type: .system)

    b.setBackgroundImage(UIImage(systemName: "person.circle")?.withRenderingMode(.alwaysOriginal), for: .normal)
    b.tintColor          = .label
    b.clipsToBounds      = true
    b.layer.cornerRadius = profileButtonSize / 2.0
//    b.layer.borderWidth  = 1
//    b.layer.borderColor  = UIColor.secondarySystemBackground.cgColor
    b.addTarget(self, action: #selector(didTapChangeProfielPicture), for: .touchUpInside)
    return b
  }()
  
  // MARK: - Model
  
  
  private var models  = [[EditProfileFormModel]]()
  
  // MARK: Lyfe Cycle
  

    override func viewDidLoad() {
        super.viewDidLoad()
      title = "Edit Profile"
      view.backgroundColor = .systemBackground
      setUpTableView()
      configureHeaderView()
      
      configureModels()
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    configureNavBar()
  }
  

  private func setUpTableView() {
    view.addSubview(tableView)
    tableView.fillSuperview()
  }
  
  private func configureModels() {
    
    var section1 = [EditProfileFormModel]()
    // Name,UserName,Bio
    ["Name","Username","Bio"].forEach{
    let model = EditProfileFormModel(label: $0, placeHolder: "Enter - \($0)", value: nil)
      section1.append(model)
    }
    models.append(section1)
    
    // Email,phone,Gender,
     var section2 = [EditProfileFormModel]()
    ["Email","Phone","Gender"].forEach{
    let model = EditProfileFormModel(label: $0, placeHolder: "Enter - \($0)", value: nil)
      section2.append(model)
    }
    
    models.append(section2)
    
    
  }
 

}

// MARK: - Header View
extension EditProfileViewController {
  
  func configureHeaderView() {
    tableView.tableHeaderView = tableHeaderView
    tableHeaderView.addSubview(profileButton)
    profileButton.centerInSuperview(size: .init(width: profileButtonSize, height: profileButtonSize))
  }
}

// MARK: - TableView Delegate DataSource
extension EditProfileViewController: UITableViewDelegate,UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return models[section].count
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
   return models.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
    let model = models[indexPath.section][indexPath.row]
    cell.textLabel?.text = model.label
    return cell
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    guard section == 1 else {
      return nil
    }
    
    return "Private Information"
  }
  
  
}

// MARK: - Configure Nav Bar
extension EditProfileViewController {
  private func configureNavBar() {
    navigationItem.rightBarButtonItems = [
    
    UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(handleSaveButton)),
    UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(handleCancelButton))
    ]
     
   }
   
   
   @objc private func handleSaveButton() {
     
   }
   @objc private func handleCancelButton() {
      dismiss(animated: true, completion: nil)
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
