//
//
// Created by __FULLUSERNAME__ on __DATE__.
// 
//
	

import Foundation
import Combine

struct OneApiRemoteDataSource {
    func fetchBooks() -> AnyPublisher<BookDataModel, Error> {
        Client.shared.call(endpoint: .book).eraseToAnyPublisher()
    }

    func fetchBook(by id: String) -> AnyPublisher<BookDataModel, Error> {
        Client
            .shared
            .call(endpoint: .book(by: id))
            .eraseToAnyPublisher()
    }

    func fetchChapters(by bookId: String) -> AnyPublisher<BookDataModel, Error> {
        Client.shared.call(endpoint: .chapter(by: bookId)).eraseToAnyPublisher()
    }
}
