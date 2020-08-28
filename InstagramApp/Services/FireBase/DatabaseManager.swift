//
//  DataBaseManger.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 27.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import Firebase

final class DatabaseManager {
  
  static let shared = DatabaseManager()
  
  private let dataBase = Database.database().reference()
  
  
  /// Can create new user?
  /// - Parametres
  ///   - username,email,password
  
  
  func canCreateNewUser(userName: String,email: String,password: String,complation:@escaping ((Bool) -> Void)) {
    complation(true)
  }
  /// Insert new user
  /// - Parametres
  ///   - username,email
  ///   - complation: Async Callback for result
  
  func insertNewUserToDatabase(userName: String,email: String,complation:@escaping ((Bool)-> Void)) {
    
    dataBase.child(email.safeDataBaseKey()).setValue(["username" : userName]) {error,_ in
      
      error == nil ? complation(true) : complation(false)
      
    }
  }
  
  
}


