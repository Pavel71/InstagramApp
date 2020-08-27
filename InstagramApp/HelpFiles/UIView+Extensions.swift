//
//  UIView+Extensions.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 27.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import UIKit


extension UIView {
  
  var width : CGFloat {
    frame.size.width
  }
  
  var height : CGFloat {
    frame.size.height
  }
  var top : CGFloat {
    frame.origin.y
  }
  var bottom : CGFloat {
    frame.origin.y + frame.size.height
  }
  
  var left : CGFloat {
    frame.origin.x
  }
  var right : CGFloat {
    frame.origin.x + frame.size.width
  }
}
