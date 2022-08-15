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

    private var onWhatsNewTriggered: () -> Void

    init(onWhatsNewTriggered: @escaping () -> Void) {
        self.onWhatsNewTriggered = onWhatsNewTriggered
        super.init(
            initialRoutes: [
                .root(
                    .start(
                        .init(
                            initialState: .init(
                                onNavigationIntent: { _ in
                                    // TODO: find out how to utilize self here
//                                    self?.onIntent(intent)
                                }
                            )
                        )
                    ),
                    embedInNavigationView: true
                )
            ]
        )
    }

    override func onIntent(_ intent: StartCoordinatorIntent) {
        print("StartCoordinator.ViewModel.onIntent: \(intent)")
        switch intent {
        case .triggerWhatsNew:
            onWhatsNewTriggered()
        case .openDetails(let book):
            routes.push(
                .startDetails(.init(initialState: .init(navigationTitle: book.name, book: book)))
            )
        }
    }
}
