//
//  StartDetailsScreenState.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 26.07.22.
//

struct StartDetailsScreenState: Reducable {
    private(set) var navigationTitle: String
    private(set) var headerText: String = "Chapter"
    private(set) var book: Book
    private(set) var isLoading: Bool = false
    private(set) var chapters: [String] = []

    func reduce(_ partialState: PartialState) -> StartDetailsScreenState {
        var newState = self
        switch partialState {
        case .isLoading:
            newState.isLoading = true
        case .error:
            newState.isLoading = false
        case .loaded(let newChapters):
            newState.isLoading = false
            newState.chapters = newChapters
        }

        return newState
    }
}

extension StartDetailsScreenState {
    enum PartialState {
        case error
        case isLoading
        case loaded([String])
    }
}
