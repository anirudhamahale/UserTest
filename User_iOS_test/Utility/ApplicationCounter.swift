//
//  ApplicationCounter.swift
//  User_iOS_test
//
//  Created by Anirudha Mahale on 24/01/24.
//

import Foundation

/// ApplicationCounter is a shared class which provides you an way to manage your application counter.
class ApplicationCounter {
  
  // Marking the init private in order to prevent creation of object.
  private init() { }
  
  static let key = "application_counter"
  
  // Shared instance of Application Counter
  static let shared = ApplicationCounter()
  
  // Number of times application has been opened
  var count: Int {
    UserDefaults.standard.value(forKey: ApplicationCounter.key) as? Int ?? 0
  }
  
  // Increment the application opened counter
  func increment() {
    UserDefaults.standard.setValue(count + 1, forKey: ApplicationCounter.key)
    print(count)
  }
  
  // Reset the application opened counter
  func reset() {
    UserDefaults.standard.setValue(0, forKey: ApplicationCounter.key)
  }
}
