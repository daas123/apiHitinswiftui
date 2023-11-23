//
//  HomeViewModel.swift
//  apiHitinswiftui
//
//  Created by Neosoft on 23/11/23.
//

import Foundation
import Combine

class HomeViewModel:ObservableObject{
    @Published var users: [ListData] = []
        private var cancellables: Set<AnyCancellable> = []
        
        private let userService = HomeServices()
        
        init() {
            fetchUsers()
        }
        
        func fetchUsers() {
            userService.fetchUsers()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print("Error: \(error)")
                    }
                }, receiveValue: { [weak self] users in
                    self?.users = users
                })
                .store(in: &cancellables)
        }
}
