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
	var error: Error?
	
	// loads the user a current page. By default it will load page 1.
	func loadUsers(currentPage: Int = 1) {
		isLoading = true
		service.getUsers(page: currentPage)
			.sink { completion in
				if case let .failure(error) = completion {
					self.error = error
				}
				self.isLoading = false
			} receiveValue: { data in
				self.totalPages = data.totalPages
				self.users.append(contentsOf: data.users)
				self.currentPage += 1
			}.store(in: &subscriptions)
	}
	
	// Loads the remaining pages.
	func loadRemaining() {
		// Checking if more pages are to be loaded else just return.
		guard currentPage <= totalPages else { return }
		loadUsers(currentPage: currentPage)
	}
}
