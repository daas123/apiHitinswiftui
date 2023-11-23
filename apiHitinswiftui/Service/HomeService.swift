//
//  HomeService.swift
//  apiHitinswiftui
//
//  Created by Neosoft on 23/11/23.
//

import Foundation
import Combine
class HomeService{
    func fetchList() -> AnyPublisher<[UserData],Error>{
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else{
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [UserData].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
