//
//  ListCellTableViewCell.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 03.09.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import UIKit

class UserFollowTableViewCell: UITableViewCell {
  
  static let cellId = "ListCellTableViewCell"
  
  
  // MARK: - Views

  private var nameLabel: UILabel = {
    let l = UILabel()
    l.font      = .systemFont(ofSize: 17, weight: .semibold)
    l.textColor = .label
    return l
  }()
  
  private var userNameLabel: UILabel = {
    let l = UILabel()
    l.font      = .systemFont(ofSize: 16, weight: .regular)
    l.textColor = .label
    return l
  }()
  
  private var followButton: UIButton = {
    let b = UIButton(type: .system)
 
    return b
  }()
  
  private var profileImageView : UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFit
    return iv
  }()
  
  // MARK: Stacks
  
  private var stack : UIStackView = {
    let s = UIStackView(arrangedSubviews: [])
  
    return s
  }()
  
  // MARK: - Clousers
  
  
  var didTapFollowButton : (() -> Void)?
  
  // MARK: - Init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setUpViews()
    followButton.addTarget(self, action: #selector(handleFollowButton), for: .touchUpInside)
  }
  
  @objc private func handleFollowButton() {
    didTapFollowButton!()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  override func prepareForReuse() {
    super.prepareForReuse()
    profileImageView.image         = nil
    nameLabel.text                 = nil
    userNameLabel.text             = nil
    followButton.backgroundColor   = nil
    followButton.layer.borderWidth = 0
    followButton.setTitle(nil, for: .normal)
    
  }
}

// MARK: - SetUpViews
extension UserFollowTableViewCell {
  private func setUpViews() {
    addSubview(nameLabel)
    nameLabel.fillSuperview()
  }
}

// MARK: - Configure View
extension UserFollowTableViewCell {
   func configure(with model : String) {
    nameLabel.text = model
  }
}
