//
//  StartScreenViewModel.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 27.07.22.
//

import SwiftUI
import Combine

class StartScreenViewModel: MviViewModel<StartScreenIntent, StartScreenState> {

    private var repository = OneApiRepository()

    override func initialize() {
        print("Start Subscription")
        repository
            .getBooks()
            .receive(on: RunLoop.main)
            .sink { _ in
                //
            } receiveValue: { [weak self] bookDataModel in
                guard let self = self else { return }
                if let model = bookDataModel {
                    let books = model
                        .docs
                        .map { Book(name: $0.name ?? "", bookId: $0.id) }
                        .compactMap { $0 }
                    self.state = self.state.reduce(.loaded(books))
                }
            }
            .store(in: &cancellables)
    }

    override func onIntent(_ intent: StartScreenIntent) {
        switch intent {
        case .detailsTap(let book):
            state.onNavigationIntent(.openDetails(book))
        case .whatsNewTap:
            self.state = state.reduce(.whatsNew)
        case .resetTap:
            UserDefaults.standard.removeObject(forKey: "kUserFinishedWelcome")
        }
    }

    func onViewWillAppear() {
        print("StartScreen.ViewModel.onAppear")
        repository.fetchBooks()
    }
}

protocol Reducable {
    associatedtype PartialState
    func reduce(_ partialState: PartialState) -> Self
}
