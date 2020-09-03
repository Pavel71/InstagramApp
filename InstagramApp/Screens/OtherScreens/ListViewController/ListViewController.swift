//
//  ListViewController.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 31.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import UIKit


class ListViewController : UIViewController {
  
  // MARK: DatSource
  
  var data : [String] = []
  
  
  // MARK: - Views
  
  
  
  private lazy var tableView : UITableView = {
    let tableView = UITableView(frame: .zero, style: .plain)
    tableView.register(UserFollowTableViewCell.self, forCellReuseIdentifier: UserFollowTableViewCell.cellId)
    tableView.delegate = self
    tableView.dataSource = self
    return tableView
  }()
  
  // MARK: - Init
  
  init(data:[String]) {
    self.data = data
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  // MARK: LyfeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "List Followers"
    view.backgroundColor = .systemBackground
    setUpViews()
  }
  
  
  private func setUpViews() {
    view.addSubview(tableView)
    tableView.fillSuperview()
  }
}

// MARK: - TableView Delegate DataSource

extension ListViewController: UITableViewDelegate,UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: UserFollowTableViewCell.cellId, for: indexPath) as! UserFollowTableViewCell
    cell.configure(with: data[indexPath.row])
    return cell
    
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
  }
  
  
}


// MARK: - Set Cell CLouser
extension ListViewController {
  
  private func setCellClousers(cell: UserFollowTableViewCell) {
    
    cell.didTapFollowButton = {[weak self] in
      print("Did Tap FolowButton")
    }
  }
}
