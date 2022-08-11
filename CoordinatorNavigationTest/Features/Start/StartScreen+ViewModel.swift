//
//  StartScreenViewModel.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 27.07.22.
//

import SwiftUI
import Combine

struct Book: Identifiable {
    var name: String
    var bookId: String
    var id: String { bookId }
}

extension StartScreen {
    class ViewModel: BaseViewModel {
        @Published var detailsButtonText = "Zu den Details"
        @Published var whatsNewButtonText = "Öffne WhatsNew"
        @Published var navTitle = "Start"
        @Published var books: [Book] = []

        private lazy var repository = { OneApiRepository() }()
        private let onNavigationIntent: (StartCoordinator.NavigationIntent) -> Void
        private var cancellables = Set<AnyCancellable>()
        private let connectable = repository
            .getBooks()
            .replaceError(with: nil)
            .share()
            .makeConnectable()

        init(onNavigationIntent: @escaping (StartCoordinator.NavigationIntent) -> Void) {
            print("StartScreen.ViewModel.Init")
            self.onNavigationIntent = onNavigationIntent
            let testconnectable = repository
                .getBooks()
                .replaceError(with: nil)
                .share()
                .makeConnectable()
            repository
                .getBooks()
                .share()
                .receive(on: RunLoop.main)
                .sink { _ in
                    //
                } receiveValue: { [weak self] bookDataModel in
                    if let model = bookDataModel {
                        self?.books = model
                            .docs
                            .map { Book(name: $0.name ?? "", bookId: $0.id) }
                            .compactMap { $0 }
                    }

                }
                .store(in: &cancellables)

        }

        func onAppear() {
            print("StartScreen.ViewModel.onAppear")
            repository.fetchBooks()
        }

        func onDetailsTap(_ book: Book) {
            onNavigationIntent(.onDetailsTapped(book))
        }

        func onWhatsNewTriggered() {
            onNavigationIntent(.onWhatsNewTriggered)
        }
    }
}
