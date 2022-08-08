//
//  TabCoordinator+ViewModel.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 07.08.22.
//

import SwiftUI
import FlowStacks

extension TabCoordinator {
    enum Tab: Int {
        case start = 0
        case settings
    }

    class ViewModel: CoordinatorModel {
        enum Screen {
            case tab
            case authentication
            case web
        }

        @State var selectedTab: Tab = .start
    }
}
