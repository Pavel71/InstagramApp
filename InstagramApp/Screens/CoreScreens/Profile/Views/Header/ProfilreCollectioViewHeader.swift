//
//  ProfilreCollectioViewHeader.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 31.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import UIKit


class ProfilreCollectioViewHeader : UICollectionReusableView {
  
  static let identifier = "ProfilreCollectioViewHeader"
  
  
  // MARK: - Views
  
  //  private lazy var containerImageView : UIView = {
  //    let v = UIView()
  //    v.addSubview(profilePhotoImageView)
  //    profilePhotoImageView.fillSuperview()
  //    v.clipsToBounds = true
  //    return v
  //  }()
  
  private lazy var profilePhotoImageView : UIImageView = {
    var iv = UIImageView()
    iv.image = #imageLiteral(resourceName: "test")
    iv.contentMode = .scaleAspectFit
    iv.clipsToBounds = true
    return iv
  }()
  
  private lazy var postsButton : UIButton = {
    var b = UIButton(type: .system)
    b.setTitle("posts", for: .normal)
    b.setTitleColor(.label, for: .normal)
    b.backgroundColor = .secondarySystemBackground
    return b
  }()
  
  private lazy var followingButton : UIButton = {
    var b = UIButton(type: .system)
    b.setTitle("following", for: .normal)
    b.setTitleColor(.label, for: .normal)
    b.backgroundColor = .secondarySystemBackground
    return b
  }()
  private lazy var followersButton : UIButton = {
    var b = UIButton(type: .system)
    b.setTitle("followers", for: .normal)
    b.setTitleColor(.label, for: .normal)
    b.backgroundColor = .secondarySystemBackground
    return b
  }()
  
  private lazy var editProfileButton : UIButton = {
    var b = UIButton(type: .system)
    b.setTitle("Edit Your Profile", for: .normal)
    b.setTitleColor(.label, for: .normal)
    b.backgroundColor = .secondarySystemBackground
    return b
  }()
  
  private lazy var namelabel : UILabel = {
    var l = UILabel()
    l.text = "Name"
    l.numberOfLines = 1
    l.sizeToFit()
    l.textColor = .label
    return l
  }()
  private lazy var biolabel : UILabel = {
    var l = UILabel()
    l.text = "SOme sheet asdsad "
    l.numberOfLines = 0
    l.sizeToFit()
    l.textColor = .label
    return l
  }()
  
  private lazy var divider: UIView = {
    let v = UIView()
    v.backgroundColor = .label
    v.alpha = 0.7
    return v
  }()
  
  // MARK: - Stacks
  
  private lazy var topButtonHstack : UIStackView = {
    let hStack = UIStackView(arrangedSubviews: [postsButton,followersButton,followingButton])
    hStack.distribution = .fillEqually
    hStack.axis         = .horizontal
    hStack.spacing      = 10
    return hStack
  }()
  
  private lazy var rightVstack: UIStackView = {
    let vStack = UIStackView(arrangedSubviews: [
      topButtonHstack,
      editProfileButton
    ])
    vStack.distribution = .fill
    vStack.axis         = .vertical
    vStack.spacing      = 10
    
    return vStack
  }()
  
  private lazy var topHStack: UIStackView = {
    let hStack = UIStackView(arrangedSubviews: [profilePhotoImageView,divider,rightVstack])
    hStack.distribution = .fill
    hStack.axis         = .horizontal
    hStack.spacing      = 8
    return hStack
  }()
  
  private lazy var bottomVstack : UIStackView = {
    let vStack = UIStackView(arrangedSubviews: [
      namelabel,
      bioLabelVstack
    ])
    vStack.distribution = .fill
    vStack.axis         = .vertical
    vStack.alignment    = .fill
//    vStack.spacing      = 5
    return vStack
  }()
  
  private lazy var bioLabelVstack: UIStackView = {
    let vStack = UIStackView(arrangedSubviews: [
      
      biolabel
    ])
    vStack.distribution = .fill
    vStack.axis         = .vertical
    vStack.alignment    = .fill
    
    return vStack
  }()
  
  private lazy var stack : UIStackView = {
    let vStack = UIStackView(arrangedSubviews: [
      topHStack,
      bottomVstack
    ])
    vStack.distribution = .fill
    vStack.axis         = .vertical
    vStack.spacing      = 10
    
    return vStack
  }()
  
  // MARK: Clousers
  
  var didTapPostButtonClouser          : (() -> Void)?
  var didTapfollowingButtonClouser     : (() -> Void)?
  var didTapfollowersButtonClouser     : (() -> Void)?
  var didTapeditProfileButtonClouser   : (() -> Void)?
  
  
  // MARK: - Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .secondarySystemBackground
    clipsToBounds   = true
    setUpViews()
    addButtonActions()
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func addButtonActions() {
    postsButton.addTarget(self, action: #selector(didTapPostButton), for: .touchUpInside)
    followersButton.addTarget(self, action: #selector(didTapFollowersButton), for: .touchUpInside)
    followingButton.addTarget(self, action: #selector(didTapFollowingButton), for: .touchUpInside)
    editProfileButton.addTarget(self, action: #selector(didEditingProfileButton), for: .touchUpInside)
  }
  
}


// MARK: - Se tup Views
extension ProfilreCollectioViewHeader {
  private func setUpViews() {
    self.addSubview(stack)
    stack.fillSuperview(padding: .init(top: 10, left: 10, bottom: 10, right: 10))
    
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    let topHstackHeight = (height * 0.5)
    
    
    profilePhotoImageView.constrainWidth(constant: topHstackHeight)
    topHStack.constrainHeight(constant: topHstackHeight)
    profilePhotoImageView.layer.cornerRadius = topHstackHeight / 2.0
    
    topButtonHstack.constrainHeight(constant: topHstackHeight * 0.55)
    divider.constrainWidth(constant: 1)
  }
}

// MARK: - Button Signals

extension ProfilreCollectioViewHeader {
  @objc private func didTapPostButton() {
    didTapPostButtonClouser!()
  }
  @objc private func didTapFollowingButton() {
    didTapfollowingButtonClouser!()
  }
  @objc private func didTapFollowersButton() {
    didTapfollowersButtonClouser!()
  }
  @objc private func didEditingProfileButton() {
    didTapeditProfileButtonClouser!()
  }
}
