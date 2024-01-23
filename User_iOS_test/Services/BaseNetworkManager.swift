//
//  BaseNetworkManager.swift
//  User_iOS_test
//
//  Created by Anirudha Mahale on 23/01/24.
//

import Foundation

class BaseNetworkManager {
  func get(url: URL) -> URLSession.DataTaskPublisher {
    clearCache()
    return URLSession.shared.dataTaskPublisher(for: url)
  }
  
  func clearCache() {
    // This is required since network requests are being cached and the previous data is retrieved when api is hit.
    URLCache.shared.removeAllCachedResponses()
  }
}
