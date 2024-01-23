//
//  MainView.swift
//  User_iOS_test
//
//  Created by Anirudha Mahale on 23/01/24.
//

import SwiftUI

struct MainView: View {
  
  @StateObject var viewModel = UsersViewModel(service: UserService())
  
  var body: some View {
    VStack {
      List(viewModel.users, id: \.id) { user in
        UserView(user: user)
      }.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
    .onAppear {
      viewModel.loadUsers()
    }
  }
}

#Preview {
  MainView()
}
