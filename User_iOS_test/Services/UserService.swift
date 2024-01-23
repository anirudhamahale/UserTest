//
//  UserService.swift
//  User_iOS_test
//
//  Created by Anirudha Mahale on 23/01/24.
//

import Foundation
import Combine

protocol UserServiceInterface {
  func getUsers() -> AnyPublisher<[User], Error>
}

class UserService: BaseNetworkManager, UserServiceInterface {
  
  private let decoder = JSONDecoder()
  
  func getUsers() -> AnyPublisher<[User], Error> {
    get(url: URL(string: "https://reqres.in/api/users")!)
      .map { $0.0 }
      .decode(type: ListResponse<User>.self, decoder: decoder)
      .map { $0.data }
      .receive(on: RunLoop.main)
      .eraseToAnyPublisher()
  }
}
