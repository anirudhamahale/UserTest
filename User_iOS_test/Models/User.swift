//
//  User.swift
//  User_iOS_test
//
//  Created by Anirudha Mahale on 23/01/24.
//

import Foundation

struct User: Codable {
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
}

