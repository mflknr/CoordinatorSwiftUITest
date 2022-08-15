//
//  StartDetailsScreenViewModel.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 26.07.22.
//

import Foundation

class StartDetailsScreenViewModel: MviViewModel<StartDetailsScreenIntent, StartDetailsScreenState> {

    private let repository = OneApiRepository()

    override func initialize() {
        self.state = state.reduce(.isLoading)
        repository.fetchChapters(by: state.book.bookId)
        repository
            .getChapters()
            .receive(on: RunLoop.main)
            .sink { completion in
                print(completion)
            } receiveValue: { [weak self] chapters in
                guard let self = self, let chapters = chapters else { return }
                self.state = self.state.reduce(.loaded(chapters))
            }
            .store(in: &cancellables)

    }

    override func onIntent(_ intent: StartDetailsScreenIntent) {
        //
    }
}
