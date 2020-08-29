//
//  ExploreViewController.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 27.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import UIKit


class ExploreViewController : UIViewController {
  
  // MARK: - Views
  
  private lazy var collectionView : UICollectionView = {
    
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.sectionInset    = .init(top: 0, left: 0, bottom: 0, right: 0)
    layout.itemSize        = .init(width: self.view.width/3, height: self.view.width/3)
    
    let collectionView  = UICollectionView(frame: .zero, collectionViewLayout: layout)
//    collectionView.delegate   = self
//    collectionView.dataSource = self
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
    collectionView.backgroundColor = .systemBackground
    return collectionView
  }()
  
  private lazy var searchBar : UISearchBar = {
    let sb = UISearchBar(frame: .zero)
    sb.backgroundColor = .secondarySystemBackground
    return sb
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    setUPCollectionView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationController?.navigationBar.topItem?.titleView = searchBar
  }
  
  func setUPCollectionView() {
    view.addSubview(collectionView)
    collectionView.fillSuperview()
  }
}


// MARK: - Collection View Delegate

//extension ExploreViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
//  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    return 1
//  }
//
//  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    UICollectionViewCell()
//  }
//
//
//}
