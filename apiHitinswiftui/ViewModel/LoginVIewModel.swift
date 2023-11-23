//
//  LoginVIewModel.swift
//  apiHitinswiftui
//
//  Created by Neosoft on 23/11/23.
//

import Foundation
import Combine
class LoginViewModel:ObservableObject{
    @Published var UserData : UserModel?
    var cancellable : Set<AnyCancellable> = []
    var userService = LoginService()
    
    func loginUser(username:String,password:String){
        userService.fetchLoginData(userName: username, password: password)
            .receive(on: DispatchQueue.main)
            .sink { complition in
                switch complition{
                case .finished:
                    break
                case .failure(let err):
                    print("there is eror in data fetching",err)
                }
            } receiveValue: { result in
                print(result)
                self.UserData = result
            }
            .store(in: &cancellable)
    }
}
