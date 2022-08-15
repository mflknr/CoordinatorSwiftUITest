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
        repository.fetchBooks()
        repository
            .getBooks()
            .receive(on: RunLoop.main)
            .sink { completion in
                print("StartScreenViewModel.getBooks() completion: \(completion)")
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
        case .showAuth:
            state.onNavigationIntent(.openAuth)
        case .showWeb:
            state.onNavigationIntent(.openWeb)
        case .showDetails(let book):
            state.onNavigationIntent(.openDetails(book))
        case .toggle(let isOn):
            self.state = state.reduce(.toggle(isOn))
        case .resetTap:
            UserDefaults.standard.set(nil, forKey: "kUserFinishedWelcome")
        }
    }
}
