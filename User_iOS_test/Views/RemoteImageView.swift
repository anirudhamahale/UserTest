//
//  RemoteImageView.swift
//  User_iOS_test
//
//  Created by Anirudha Mahale on 23/01/24.
//

import SwiftUI

struct RemoteImageView: View {
    
    let url: URL?
    let placeholder: Image?
    @State private var data: Data?
    
    var body: some View {
        VStack {
            if let data = data, let image = UIImage(data: data) {
                Image(uiImage: image)
                    .resizable()
            } else if let placeholder = placeholder {
                placeholder
                    .resizable()
            } else {
                EmptyView()
            }
        }.onAppear {
            loadImage()
        }
    }
    
    private func loadImage() {
        guard let url = url else { return }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data else { return }
            CacheManager.shared.cacheImage(data: data as NSData, url: url as NSURL)
            self.data = data
        }.resume()
    }
}
