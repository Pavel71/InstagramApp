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
  
  // MARK: - Views
  private lazy var gridButton : UIButton = {
    let b = UIButton(type: .system)
    
    b.clipsToBounds = true
    b.tintColor     = .systemBlue
    
    let image = UIImage(systemName: "square.grid.2x2")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 22))
    b.setImage(image, for: .normal)
    
    return b
  }()
  
  private lazy var taggedButton : UIButton = {
    let b = UIButton(type: .system)
    
    b.clipsToBounds = true
    b.tintColor     = .lightGray
    let image = UIImage(systemName: "tag")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 22))
    
    b.setImage(image, for: .normal)
    return b
  }()
  
  // MARK: - Stacks
  
  
  
  private lazy var stack : UIStackView = {
    let stack = UIStackView(arrangedSubviews: [gridButton,UIView(),taggedButton])
    stack.distribution = .fillEqually
    stack.axis         = .horizontal
    
    return stack
  }()
  
  
  // MARK: Clousers
  
  var didTapTagButton : (() -> Void)?
  var didTapGridButton : (() -> Void)?
  
  
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setViews()
    
    [taggedButton,gridButton].forEach{
      $0.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
    }
  }
  
  @objc private func handleButtonTapped(button: UIButton) {
    
    switch button {
    case taggedButton :
      taggedButton.tintColor = .systemBlue
      gridButton.tintColor   = .lightGray
      didTapTagButton!()
    case gridButton:
      taggedButton.tintColor = .lightGray
      gridButton.tintColor   = .systemBlue
      didTapGridButton!()
    default:
      break
    }
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Set Views
extension ProfileTabsCollectionReusableView {
  
  private func setViews() {
    
    addSubview(stack)
    stack.fillSuperview(padding: .init(top: 5, left: 5, bottom: 0, right: 5))
  }
  
  
}
