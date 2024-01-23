//
//  UsersViewModel.swift
//  User_iOS_test
//
//  Created by Anirudha Mahale on 23/01/24.
//

import Foundation
import Combine

class UsersViewModel: ObservableObject {
	
	@Published var users: [User]
	
	let service: UserServiceInterface
	
	var subscriptions = Set<AnyCancellable>()
	
	init(service: UserServiceInterface) {
		self.service = service
		self.users = []
	}
	
	func loadUsers() {
		service.getUsers()
			.sink { completion in
				print(completion)
			} receiveValue: { users in
				self.users.append(contentsOf: users)
			}.store(in: &subscriptions)

	}
	
}
