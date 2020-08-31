//
//  ProfileTabsCollectionReusableView.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 31.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import UIKit

class ProfileTabsCollectionReusableView: UICollectionReusableView {
    
  static let identifier  = "ProfileTabsCollectionReusableView"
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .systemPink
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
