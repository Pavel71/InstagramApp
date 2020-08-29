//
//  NotificationViewController.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 27.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {
  
  // MARK: - Views
  
  private lazy var tableView : UITableView = {
    let table = UITableView(frame: .zero, style: .grouped)
    table.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    table.backgroundColor = .systemBackground
    table.delegate   = self
    table.dataSource = self
    return table
  }()
  

    override func viewDidLoad() {
        super.viewDidLoad()

      title                = "Notification"
      view.backgroundColor = .systemBackground
      setUPTableView()
    }
    
  private func setUPTableView() {
    view.addSubview(tableView)
    tableView.fillSuperview()
  }

    

}

extension NotificationViewController: UITableViewDelegate,UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    UITableViewCell()
  }
  
  
}
