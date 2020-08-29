//
//  StoregManager.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 27.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import FirebaseStorage


// MARK: Storege Model


enum UserPostType {
  case photo,video
}

struct UserPost {
  var postType: UserPostType
}


final class StoragManager {
  
  static let shared = StoragManager()
  
  private let bucket = Storage.storage().reference()
  
  
  public func uploadUserPhotoPost(model: UserPost,complation: @escaping ((Result<URL,Error>) -> Void)) {
    
  }
}
