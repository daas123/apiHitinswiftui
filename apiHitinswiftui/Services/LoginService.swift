//
//  LoginService.swift
//  apiHitinswiftui
//
//  Created by Neosoft on 23/11/23.
//

import Foundation
import Combine
class LoginService{
    func fetchLoginData(userName: String , password : String) -> AnyPublisher<UserModel,Error>{
        let param = ["email" : userName , "password" : password]
        guard let url = URL(string: "http://staging.php-dev.in:8844/trainingapp/api/users/login") else{
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: param)
        }catch{
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: UserModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
