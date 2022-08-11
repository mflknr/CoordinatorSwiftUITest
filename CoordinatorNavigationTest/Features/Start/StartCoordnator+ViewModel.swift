//
//  StartCoordnatorViewModel.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 27.07.22.
//

import SwiftUI
import FlowStacks

extension StartCoordinator {
    enum NavigationIntent {
        case onWhatsNewTriggered
        case onDetailsTapped(Book)
    }

    class ViewModel: CoordinatorModel {

        enum Screen {
            case start(StartScreen.ViewModel)
            case startDetails(StartDetailsScreen.ViewModel)
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
                            onNavigationIntent: { intent in
                                print("StartScreen.ViewModel.onIntent")
                                self.onIntent(intent)
                            }
                        )
                    ),
                    embedInNavigationView: true
                )
            ]
        }

        func onIntent(_ intent: StartCoordinator.NavigationIntent) {
            print("StartCoordinator.ViewModel.onIntent: \(intent)")
            switch intent {
            case .onWhatsNewTriggered:
                onWhatsNewTriggered()
            case .onDetailsTapped:
                routes.push(.startDetails(.init()))
            }
        }
    }
}
