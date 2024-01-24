//
//  DetailView.swift
//  User_iOS_test
//
//  Created by Anirudha Mahale on 23/01/24.
//

import SwiftUI

struct DetailView: View {
  
  let user: User
  
  var body: some View {
    VStack {
      RemoteImageView(url: URL(string: user.avatar), placeholder: nil)
        .frame(width: 160, height: 160)
        .cornerRadius(80)
        .padding(.top)
      
      Text(user.fullName)
        .font(.system(size: 16, weight: .bold))
        .foregroundColor(Color.black)
        .padding(.top)
      
      Text(user.email)
        .font(.system(size: 14, weight: .regular))
        .foregroundColor(Color.black)
        .padding(.vertical)
    }.frame(maxWidth: .infinity)
      .background(Color.gray.opacity(0.1))
      .padding(.horizontal, 36)
  }
}
