//
//  String+Extension.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 28.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import Foundation


extension String {
  
  func safeDataBaseKey() -> String {
    
    self.replacingOccurrences(of:".", with: "-").replacingOccurrences(of:"@", with: "-")
  }
}
