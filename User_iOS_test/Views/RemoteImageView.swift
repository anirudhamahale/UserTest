//
//  RemoteImageView.swift
//  User_iOS_test
//
//  Created by Anirudha Mahale on 23/01/24.
//

import SwiftUI
import CachedAsyncImage

struct RemoteImageView: View {
  
  let url: URL?
  let placeholder: Image?
  @State private var data: Data?
  
  var body: some View {
    if let url = url {
      CachedAsyncImage(url: url) { image in
          image
            .resizable()
        } placeholder: {
          placeholder
        }
    } else if let placeholder = placeholder {
      placeholder
        .resizable()
    } else {
      EmptyView()
    }
  }
}
