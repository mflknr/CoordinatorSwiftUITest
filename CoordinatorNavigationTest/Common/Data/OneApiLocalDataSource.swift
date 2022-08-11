//
//
// Created by __FULLUSERNAME__ on __DATE__.
// 
//
	

import Foundation
import Combine

struct OneApiLocalDataSource {

    var currentBooks = CurrentValueSubject<BookDataModel?, Never>(nil)
    var currentChapters = CurrentValueSubject<[String]?, Never>(nil)

    func subscribeToBooks() -> AnyPublisher<BookDataModel?, Error> {
        currentBooks
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func subscribeToChapters() -> AnyPublisher<[String]?, Error> {
        currentChapters
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func save(_ model: BookDataModel) {
        currentBooks.send(model)
    }

    func save(_ chapters: [String]) {
        currentChapters.send(chapters)
    }
}
