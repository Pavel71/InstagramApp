//
//  PostViewController.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 31.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import UIKit


class PostViewController : UIViewController {
  
  // MARK: - Views
  
  
  private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .plain)
    
    return tableView
  }()
  
  
  // MARK: - Init
  
  private let model : UserPost?
  
  
  init(model: UserPost? = nil) {
    self.model = model
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  

  
  // MARK: - Lyfe cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemGreen
    
    title = "Post"
    setUpViews()
  }
  
  
  
  private func setUpViews() {
    view.addSubview(tableView)
    tableView.fillSuperview()
  }
}

extension PostViewController: UITableViewDelegate,UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 0
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  
}
