//
//  TabCoordinator+ViewModel.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 07.08.22.
//

import SwiftUI
import FlowStacks

enum Tab: Int {
    case start = 0
    case settings
}

enum TabCoordinatorScreen {
    case tab
    case authentication
    case web
}

enum TabCoordinatorIntent {
    case showWeb
    case showAuth
}

class TabCoordinatorViewModel: CoordinatorModel<TabCoordinatorIntent, TabCoordinatorScreen> {

    @Published var selectedTab: Tab

    lazy var startCoordinatorViewModel: StartCoordinatorViewModel = .init(
        onWebIntent: {
            self.onIntent(.showWeb)
        },
        onAuthIntent: {
            self.onIntent(.showAuth)
        }
    )

    init() {
        self.selectedTab = .start
        super.init(initialRoutes: [.root(.tab)])
    }

    override func onIntent(_ intent: TabCoordinatorIntent) {
        switch intent {
        case .showAuth:
            routes.presentSheet(.authentication)
        case .showWeb:
            routes.presentSheet(.web)
        }
    }
}
