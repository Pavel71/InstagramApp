//
//  IGFeedPostTableViewCell.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 29.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import UIKit

class IGFeedPostTableViewCell: UITableViewCell {
  
  static let cellID = "IGFeedPostTableViewCell"

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  

}
