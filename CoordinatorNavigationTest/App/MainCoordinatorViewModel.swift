//
//  MainCoordinator+ViewModel.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 07.08.22.
//

import SwiftUI
import FlowStacks

enum MainCoordinatorIntent {
    case firstStart
    case showTab
    case showWelcome
    case finishedWelcome
}

enum MainCoordinatorScreen {
    case tab(TabCoordinatorViewModel)
    case welcome(WelcomeCoordinatorViewModel)
}

class MainCoordinatorViewModel: CoordinatorModel<MainCoordinatorIntent, MainCoordinatorScreen> {

    private let kUserFinishedWelcome = "kUserFinishedWelcome"
    private var userFinishedWelcome: Bool {
        get {
            UserDefaults.standard.bool(forKey: kUserFinishedWelcome)
        }

        set {
            UserDefaults.standard.set(newValue, forKey: kUserFinishedWelcome)
        }
    }

    init() {
        super.init(initialRoutes: [])
        onIntent(.firstStart)
    }

    override func onIntent(_ intent: MainCoordinatorIntent) {
        switch intent {
        case .firstStart:
            if userFinishedWelcome {
                showTabAsRoot()
            } else {
                routes = [
                    .root(
                        .welcome(
                            .init(
                                onFinishedWelcome: { self.onIntent(.finishedWelcome) }
                            )
                        )
                    )
                ]
            }
        case .showTab:
            showTabAsRoot()
        case .showWelcome:
            routes = [
                .root(
                    .welcome(
                        .init(
                            onFinishedWelcome: { self.onIntent(.finishedWelcome) }
                        )
                    )
                )
            ]
        case .finishedWelcome:
            userFinishedWelcome = true
            showTabAsRoot()
        }
    }

    func onOpenUrl(_ url: URL) {
        print("MainCoordinatorViewModel.onOpenUrl: \(url)")
    }

    private func showTabAsRoot() {
        routes = [.root(.tab(.init()))]
    }
}
