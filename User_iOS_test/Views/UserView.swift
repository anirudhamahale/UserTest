//
//  UserView.swift
//  User_iOS_test
//
//  Created by Anirudha Mahale on 23/01/24.
//

import SwiftUI

struct UserView: View {
  
  let user: User
  @State var showSheetView = false
  
  var body: some View {
    HStack(alignment: .center, spacing: 16) {
      // ImageView
      
      RemoteImageView(url: URL(string: user.avatar), placeholder: nil)
        .frame(width: 60, height: 60)
        .cornerRadius(30)
      
      // Full name
      Text(user.fullName)
        .font(.system(size: 16, weight: .bold))
        .foregroundColor(Color.black)
      
      Spacer()
    }.padding()
      .background(Color.gray.opacity(0.1))
      .cornerRadius(8)
      .onTapGesture {
        showSheetView.toggle()
      }
      .sheet(isPresented: $showSheetView, content: {
        DetailView(user: user)
          // .frame(maxWidth: .infinity, maxHeight: .infinity)
      })
      
  }
}

#Preview {
  UserView(user: .testUser())
}
