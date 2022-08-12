//
//  StartCoordinatorViewModel.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 27.07.22.
//

import SwiftUI
import FlowStacks

class StartCoordinatorViewModel: CoordinatorModel {
    

    enum Screen {
        case start(StartScreenViewModel)
        case startDetails(StartDetailsScreenViewModel)
    }

    @Published var routes: Routes<Screen> = []

    private let onWhatsNewTriggered: () -> Void

    init(onWhatsNewTriggered: @escaping () -> Void) {
        print("StartCoordinator.ViewModel.Init")
        self.onWhatsNewTriggered = onWhatsNewTriggered
        self.routes = [
            .root(
                .start(
                    .init(
                        initialState: .init(
                            onNavigationIntent: { intent in
                                print("StartScreen.ViewModel.onIntent")
                                self.onIntent(intent)
                            }
                        )
                    )
                ),
                embedInNavigationView: true
            )
        ]
    }

    func onIntent(_ intent: StartNavigationIntent) {
        print("StartCoordinator.ViewModel.onIntent: \(intent)")
        switch intent {
        case .triggerWhatsNew:
            onWhatsNewTriggered()
        case .openDetails(let book):
            routes.push(
                .startDetails(.init(initialState: .init(book: book)))
            )
        }
    }
}
