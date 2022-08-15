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

enum TabCoordinatorIntent {}

class TabCoordinatorViewModel: CoordinatorModel<TabCoordinatorIntent, TabCoordinatorScreen> {

    @Published var selectedTab: Tab

    init() {
        self.selectedTab = .start
        super.init(initialRoutes: [.root(.tab)])
    }

    override func onIntent(_ intent: TabCoordinatorIntent) {
        // do nothing
    }
}
