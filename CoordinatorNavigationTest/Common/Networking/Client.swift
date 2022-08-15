//
//  MainCoordinator.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 26.07.22.
//

import Foundation
import Combine

enum ClientError: Error {
    case invalidUrl
}

class Client {
    static let shared = Client()

    private let baseUrl = "https://the-one-api.dev/v2"
    private let decoder = JSONDecoder()

    private init() {}

    func call<T: Decodable>(
        endpoint: Endpoint
    ) -> AnyPublisher<T, Error> {
        guard let url = URL(string: baseUrl + endpoint.path) else {
            return Fail(error: ClientError.invalidUrl).eraseToAnyPublisher()
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.headers
        request.setValue("application/jso", forHTTPHeaderField: "Accept")

        return URLSession
            .shared
            .dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
