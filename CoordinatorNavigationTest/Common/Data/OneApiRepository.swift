//
//
// Created by __FULLUSERNAME__ on __DATE__.
// 
//
	

import Foundation
import Combine

class OneApiRepository {

    private let localDataSource = OneApiLocalDataSource()
    private let remoteDataSource = OneApiRemoteDataSource()

    private var cancellables = Set<AnyCancellable>()

    func getBooks() -> AnyPublisher<BookDataModel?, Error> {
        localDataSource.subscribeToBooks()
    }

    func getBook(by id: String) -> AnyPublisher<String, Error> {
        remoteDataSource
            .fetchBook(by: id)
            .map {
                $0.docs.first?.name ?? ""
            }
            .eraseToAnyPublisher()
    }

    func getChapters() -> AnyPublisher<[String]?, Error> {
        localDataSource.subscribeToChapters()
    }

    func fetchBooks() {
        remoteDataSource
            .fetchBooks()
            .sink { completion in
                print(completion)
            } receiveValue: { [weak self] dataModel in
                self?.localDataSource.save(dataModel)
            }
            .store(in: &cancellables)
    }
    
    func fetchChapter(by id: String) {
        remoteDataSource
            .fetchChapters(by: id)
            .sink(
                receiveCompletion: { completion in
                    print(completion)
                },
                receiveValue: { [weak self] dataModel in
                    self?.localDataSource.save(dataModel)
                }
            )
            .store(in: &cancellables)
    }
}
