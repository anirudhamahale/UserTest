//
//  ListResponse.swift
//  User_iOS_test
//
//  Created by Anirudha Mahale on 23/01/24.
//

import Foundation

struct ListResponse<T: Codable>: Codable {
  let page: Int
  let data: [T]
  
  enum CodingKeys: String, CodingKey {
    case page
    case data
  }
}
