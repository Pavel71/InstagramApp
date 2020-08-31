//
//  StoregManager.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 27.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import FirebaseStorage


// MARK: Storege Model




final class StoragManager {
  
  enum IGStorageManagerError: Error {
    case downLoadError
    
    
    var localizedDescription: String {
      switch self {
      case .downLoadError:
        return "Ошибка загрузки данных"
      
      }
    }
  }
  
  static let shared = StoragManager()
  
  private let bucket = Storage.storage().reference()
  
  
  public func uploadUserPhotoPost(model: UserPost,complation: @escaping ((Result<URL,Error>) -> Void)) {
    
  }
  
  public func downLoadImage(reference : String, complation:@escaping ((Result<URL,IGStorageManagerError>) -> Void)) {
    
    bucket.child(reference).downloadURL { (url, error) in
      guard
        let url = url,
        error   != nil
        else {return complation(.failure(.downLoadError)) }
      
      complation(.success(url))
    }
    
  }
}
