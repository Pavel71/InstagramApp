//
//  PhotoCollectionViewCell.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 31.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import UIKit


final class PhotoCollectionViewCell: UICollectionViewCell {
  
  static let cellID = "PhotoCollectionViewCell"
  
  private lazy var photoImageView: UIImageView = {
    let iv = UIImageView(image: #imageLiteral(resourceName: "test"))
    iv.contentMode = .scaleAspectFit
    return iv
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    accessibilityLabel = "User post Image"
    accessibilityHint  = "Doubple tap to open post"
    setUpViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    photoImageView.image = nil
  }
  
}


// MARK: - Set Up Views

extension PhotoCollectionViewCell {
  private func setUpViews() {
    contentView.addSubview(photoImageView)
    photoImageView.fillSuperview()
  }
}

// MARK: - Configure Cell

extension PhotoCollectionViewCell {
  func configure(with model: UserPost) {
    let thumbNailUrl = model.thumbNailImage
    photoImageView.image = model
  }
}
