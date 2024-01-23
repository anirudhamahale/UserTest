//
//  UserView.swift
//  User_iOS_test
//
//  Created by Anirudha Mahale on 23/01/24.
//

import SwiftUI

struct UserView: View {
  
  let user: User
  
  var body: some View {
    HStack(alignment: .center, spacing: 16) {
      // ImageView
      
      RemoteImageView(url: URL(string: user.avatar), placeholder: nil)
        .frame(width: 60, height: 60)
      
      // Full name
      Text(user.fullName)
        .font(.system(size: 16))
        .foregroundColor(Color.black)
      
      Spacer()
    }.padding()
      .background(Color.gray.opacity(0.1))
  }
}

#Preview {
  UserView(user: .testUser())
}
