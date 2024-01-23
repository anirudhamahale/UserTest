//
//  User.swift
//  User_iOS_test
//
//  Created by Anirudha Mahale on 23/01/24.
//

import Foundation

struct UserContainer: Codable {
  let page: Int
  let totalPages: Int
  let users: [User]
  
  enum CodingKeys: String, CodingKey {
    case page
    case totalPages = "total_pages"
    case users = "data"
  }
}

struct User: Codable, Equatable {
  let id: Int
  let email, firstName, lastName: String
  let avatar: String
  
  var fullName: String {
    return "\(firstName) \(lastName)"
  }
  
  enum CodingKeys: String, CodingKey {
    case id, email
    case firstName = "first_name"
    case lastName = "last_name"
    case avatar
  }
  
  static func testUser() -> User {
    return User(id: 11, email: "anirudha@gmail.com", firstName: "Anirudha", lastName: "Mahale", avatar: "https://reqres.in/img/faces/1-image.jpg")
  }
  
  static func ==(lhs: User, rhs: User) -> Bool {
    return lhs.id == rhs.id
  }
}

