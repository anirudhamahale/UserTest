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
	
	var currentPage = 1
	var totalPages = 0
	var isLoading = false
	
	func loadUsers(currentPage: Int = 1) {
		isLoading = true
		service.getUsers(page: currentPage)
			.sink { completion in
				print(completion)
				self.isLoading = false
			} receiveValue: { data in
				self.totalPages = data.totalPages
				self.users.append(contentsOf: data.users)
				self.currentPage += 1
			}.store(in: &subscriptions)
	}
	
	func loadRemaining() {
		// Checking if more pages are to be loaded else just return.
		guard currentPage <= totalPages else { return }
		loadUsers(currentPage: currentPage)
	}
	
}
