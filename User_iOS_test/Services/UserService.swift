//
//  UserService.swift
//  User_iOS_test
//
//  Created by Anirudha Mahale on 23/01/24.
//

import Foundation
import Combine

protocol UserServiceInterface {
  
  /// Retrives list of users  present at the current page
  /// - Parameter page: Page index you want to fetch
  /// - Returns: 
  func getUsers(page: Int) -> AnyPublisher<UserContainer, Error>
}

class UserService: BaseNetworkManager, UserServiceInterface {
  
  private let decoder = JSONDecoder()
  
  func getUsers(page: Int) -> AnyPublisher<UserContainer, Error> {
    get(url: URL(string: "https://reqres.in/api/users?page=\(page)")!)
      .map { $0.0 }
      .decode(type: UserContainer.self, decoder: decoder)
      .receive(on: RunLoop.main)
      .eraseToAnyPublisher()
  }
}
