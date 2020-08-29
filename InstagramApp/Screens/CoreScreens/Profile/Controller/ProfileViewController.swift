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
    layout.itemSize        = .init(width: self.view.width/3, height: self.view.width/3)
    
    let collectionView  = UICollectionView(frame: .zero, collectionViewLayout: layout)
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
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    UICollectionViewCell()
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)
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
