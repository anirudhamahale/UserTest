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
      let users = viewModel.users
      List(users, id: \.id) { user in
        UserView(user: user)
          .onAppear {
            if user.id == users.last?.id {
              viewModel.loadRemaining()
            }
          }
      }
    }
    .onAppear {
      viewModel.loadUsers()
    }
  }
}

#Preview {
  MainView()
}

