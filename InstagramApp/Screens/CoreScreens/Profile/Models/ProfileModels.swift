//
//  ProfileModels.swift
//  InstagramApp
//
//  Created by Павел Мишагин on 31.08.2020.
//  Copyright © 2020 Павел Мишагин. All rights reserved.
//

import UIKit



enum UserPostType {
  case photo,video
}

struct UserPost {
  var postType          : UserPostType
  let thumbNailImageURL : URL
  let postUrl           : URL
  let caption           : String?
  let likePoint         : [PostLikes]
  let comments          : [PostComment]
  let createdDate       : Date
}

struct PostLikes {
  let userName       : String
  let postIdentifier : String
}

struct PostComment {
  let identifire  : String
  let userName    : String
  let text        : String
  let createdDate : Date
  let likes       : [CommentLike]
}

struct CommentLike {
  let userName          : String
  let commentIdentifier : String
}



