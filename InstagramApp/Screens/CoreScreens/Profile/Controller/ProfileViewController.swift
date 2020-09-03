//
//  ProfileViewController.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 27.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import UIKit

/// Profile view controller

final class ProfileViewController: UIViewController {
  
  
  enum Section: Int, CaseIterable {
    case profile
    case tabs
  }
  
  // MARK: - Views
  
  private lazy var collectionView : UICollectionView = {
    
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.sectionInset    = .init(top: 0, left: 0, bottom: 0, right: 0)
    layout.minimumLineSpacing      = 5
    let itemSpacing:CGFloat        = 2
    layout.minimumInteritemSpacing = itemSpacing
    
    let size               = (view.width/3) - (itemSpacing*4)
    
    layout.itemSize        = .init(width: size, height: size)
    layout.sectionInset    = .init(top: 0, left: 5, bottom: 0, right: 5)
    
    let collectionView  = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.cellID)
    collectionView.register(ProfilreCollectioViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfilreCollectioViewHeader.identifier)
    collectionView.register(ProfileTabsCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileTabsCollectionReusableView.identifier)
//    collectionView.contentInset = .init(top: 10, left: 5, bottom: 10, right: 5)
    collectionView.delegate   = self
    collectionView.dataSource = self
    collectionView.backgroundColor = .systemBackground
    
    return collectionView
  }()
  
  // MARK: - Model
  
  var userPosts:[UserPost]  = []
  
  
  
  
  // MARK: - Lyfe Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpCollectionView()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    configureNavBar()
  }
  
  private func setUpCollectionView() {
    view.addSubview(collectionView)
    collectionView.fillSuperview()
    
  }
}

// MARK: -  CollectionView Delegate DataSource
extension ProfileViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate {
  
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return Section.allCases.count
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    guard let section = Section(rawValue: section) else {return 0}
    switch section {
    case .profile:
      return 0
    case .tabs:
      return 30
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
//    let model = userPosts[indexPath.row]
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.cellID, for: indexPath) as! PhotoCollectionViewCell
//    cell.configure(with: nil)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)
    
//    let model = userPosts[indexPath.row]
    let vc = PostViewController()
    vc.navigationItem.largeTitleDisplayMode = .never
    navigationController?.pushViewController(vc, animated: true)
    
  }

  
  // MARK: - Header
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
    guard kind == UICollectionView.elementKindSectionHeader else {
      return UICollectionReusableView()
    }
    
    guard let section = Section(rawValue: indexPath.section) else {return UICollectionReusableView()}
    let header : UICollectionReusableView
    
    switch section {
    case .profile :
      header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProfilreCollectioViewHeader.identifier, for: indexPath) as! ProfilreCollectioViewHeader
      setProfileHeaderClouser(header: header as! ProfilreCollectioViewHeader)
    case .tabs    :
      header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProfileTabsCollectionReusableView.identifier, for: indexPath) as! ProfileTabsCollectionReusableView
      setTabsHeaderClousers(header: header as! ProfileTabsCollectionReusableView)
    }
    
    
    
    return header
  }
  
  
  // MARK: Header Height
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    
    guard let section = Section(rawValue: section) else {return .zero}
    
    switch section {
    case .profile:
      return .init(width: collectionView.width, height: collectionView.height / 4)
    case .tabs:
      return .init(width: collectionView.width, height: 50)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    guard let section = Section(rawValue: section) else {return .zero}
    
    return section == .tabs ? UIEdgeInsets(top: 10, left: 2, bottom: 0, right: 2) : .zero
  }
  

}

// MARK: - Configure Nav Bar
extension ProfileViewController {
  
  private func configureNavBar() {
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapGearButton))
  }
  
  @objc private func didTapGearButton() {
    let vc = SettingsViewController()
    navigationController?.pushViewController(vc, animated: true)
  }
}

// MARK:  Header Clousers
extension ProfileViewController {
  
  
  func setTabsHeaderClousers(header : ProfileTabsCollectionReusableView) {
    header.didTapGridButton = {[weak self] in
      print("Grid")
    }
    
    header.didTapTagButton = {[weak self] in
      print("Tagged")
    }
  }
  
  
  
  func setProfileHeaderClouser(header: ProfilreCollectioViewHeader) {
    
    header.didTapeditProfileButtonClouser = {[weak self] in
      print("Edit Profile")
      let vc = UINavigationController(rootViewController:EditProfileViewController())
      self?.present(vc, animated: true, completion: nil)
    }
    header.didTapfollowingButtonClouser = {[weak self] in
      
      let vc = ListViewController(data: ["John","Smith"])
      vc.title = "Following"
      vc.navigationItem.largeTitleDisplayMode = .never
      
      self?.navigationController?.pushViewController(vc, animated: true)
    }
    header.didTapPostButtonClouser      = {[weak self] in
      
      self?.collectionView.scrollToItem(at: .init(row: 0, section: 1), at: .top, animated: true)
    }
    header.didTapfollowersButtonClouser = {[weak self] in
      
      let vc = ListViewController(data: ["John","Smith"])
      vc.title = "Followers"
      vc.navigationItem.largeTitleDisplayMode = .never
      
      self?.navigationController?.pushViewController(vc, animated: true)
    }
  }
}
