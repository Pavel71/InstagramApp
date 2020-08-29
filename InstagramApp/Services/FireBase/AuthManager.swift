//
//  AuthManager.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 27.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import FirebaseAuth


final class AuthManager {
  
  static let shared = AuthManager()
  var dataBaseManager : DatabaseManager! = ServiceLocator.shared.getService()
  
  
  // MARK: - Register User
  func registerNewUser(userName: String,email: String,password: String,complation: @escaping ((Bool) -> Void)) {
    
    dataBaseManager.canCreateNewUser(userName: userName, email: email, password: password) { canCreate in
      
      if canCreate {
        // Created new User
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
          if error != nil {
            complation(false)
            return
          }
          // Can Insert User to DB
          self.dataBaseManager.insertNewUserToDatabase(userName: userName, email: email) { inserted in
            
            
            inserted ? complation(true) : complation(false)
            return
          }
          
        }
      } else { // Can Create
        complation(false)
        return
      }
      
      
    }
    
    
     
   }
   
  // MARK: - Login User
  func loginUser(userName:String?,email:String?,password:String,complation:@escaping (Bool) -> Void) {
     
    if let userName = userName {
      
      print(userName)
      
    } else if let email = email {
      print("Email")
      Auth.auth().signIn(withEmail: email, password: password) { (authRes, error) in
        guard
            authRes != nil,
            error   == nil
        else {return complation(false)}
        
        complation(true)
        return
      }
    } else {
      complation(false)
      return
    }
    
    
    
   }
  
  
  // MARK: - Sign Out
  func signOut(complation:@escaping ((Bool) -> Void)) {
        do {
          try Auth.auth().signOut()
          complation(true)
          return
        } catch {
          print("Sigon out er")
          complation(false)
        }
  }
}
