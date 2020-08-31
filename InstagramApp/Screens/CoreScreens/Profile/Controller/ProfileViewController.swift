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
    layout.sectionInset    = .init(top: 5, left: 5, bottom: 5, right: 5)
    
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
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 30
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.cellID, for: indexPath) as! PhotoCollectionViewCell
//    cell.configure(with: nil)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)
  }
  
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//    return .init(width: 100, height: 100)
//  }
  

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
