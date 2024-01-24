//
//  BaseNetworkManager.swift
//  User_iOS_test
//
//  Created by Anirudha Mahale on 23/01/24.
//

import Foundation

class BaseNetworkManager {
  func get(url: URL) -> URLSession.DataTaskPublisher {
    return URLSession.shared.dataTaskPublisher(for: url)
  }
}
