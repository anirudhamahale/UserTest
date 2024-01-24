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
      if users.count == 0 && viewModel.isLoading {
        loader
      } else if users.count > 0 {
        userList
      }
    }
    .onAppear {
      viewModel.loadUsers()
    }
    .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
      // Updating the counter when the application is launched and becomes active from background state.
      ApplicationCounter.shared.increment()
    }
  }
  
  // Property to render loading view
  private var loader: some View {
    VStack {
      Spacer()
      ActivityIndicator(isAnimating: .constant(true))
      Spacer()
    }
  }
  
  // Property to render users list.
  private var userList: some View {
    let users = viewModel.users
    return List(users, id: \.id) { user in
      UserView(user: user)
        .onAppear {
          if user.id == users.last?.id {
            viewModel.loadRemaining()
          }
        }
      
      if user.id == users.last?.id && viewModel.isLoading {
        HStack {
          Spacer()
          ActivityIndicator(isAnimating: $viewModel.isLoading)
          Spacer()
        }
      }
    }
  }
  
  // Property to render any error occured while fetching the data.
  private var errorView: some View {
    VStack {
      Spacer()
      Text(viewModel.error?.localizedDescription ?? "Unknown Error Occured!!")
        .font(.system(size: 16, weight: .bold))
        .foregroundColor(Color.black)
      Spacer()
    }
  }
}

#Preview {
  MainView()
}

