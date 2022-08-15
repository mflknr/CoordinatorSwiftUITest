//
//  StartCoordinatorViewModel.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 27.07.22.
//

import SwiftUI
import FlowStacks

enum StartCoordinatorScreen {
    case start(StartScreenViewModel)
    case startDetails(StartDetailsScreenViewModel)
}

class StartCoordinatorViewModel: CoordinatorModel<StartCoordinatorIntent, StartCoordinatorScreen> {

    private var onWebIntent: () -> Void
    private var onAuthIntent: () -> Void

    init(
        onWebIntent: @escaping () -> Void,
        onAuthIntent: @escaping () -> Void
    ) {
        self.onWebIntent = onWebIntent
        self.onAuthIntent = onAuthIntent
        super.init()
        self.routes = [
            .root(
                .start(
                    .init(
                        initialState: .init(
                            onNavigationIntent: { [weak self] intent in
                                self?.onIntent(intent)
                            }
                        )
                    )
                ),
                embedInNavigationView: true
            )
        ]
    }

    override func onIntent(_ intent: StartCoordinatorIntent) {
        switch intent {
        case .openAuth:
            onAuthIntent()
        case .openWeb:
            onWebIntent()
        case .openDetails(let book):
            routes.push(
                .startDetails(.init(initialState: .init(navigationTitle: book.name, book: book)))
            )
        }
    }
}
