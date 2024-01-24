//
//  ActivityIndicator.swift
//  User_iOS_test
//
//  Created by Anirudha Mahale on 23/01/24.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
  
  @Binding var isAnimating: Bool
  
  func makeUIView(context: Context) -> UIActivityIndicatorView {
    let v = UIActivityIndicatorView()
    return v
  }
  
  func updateUIView(_ activityIndicator: UIActivityIndicatorView, context: Context) {
    if isAnimating {
      activityIndicator.startAnimating()
    } else {
      activityIndicator.stopAnimating()
    }
  }
}
