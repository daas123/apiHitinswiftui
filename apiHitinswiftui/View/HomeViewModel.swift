//
//  HomeViewModel.swift
//  apiHitinswiftui
//
//  Created by Neosoft on 23/11/23.
//


import Foundation
import Combine


class HomeViewModel : ObservableObject{
    @Published var user : [UserData] = []
    var cancellable : Set<AnyCancellable> = []
    let userService = HomeService()
    
    func fetchUsers(){
        userService.fetchList()
            
            .receive(on: DispatchQueue.main)
            .sink { complition in
                switch complition{
                case .finished:
                    break
                case .failure(let error):
                    print("Erro is \(error)")
                }
            } receiveValue: {[weak self] output in
                self?.user = output
            }
            .store(in: &cancellable)

            
    }
}
