//
//  MainCoordinator+ViewModel.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 07.08.22.
//

import SwiftUI
import FlowStacks

extension MainCoordinator {
    enum Screen {
        case tab
        case welcome
    }

    class ViewModel: CoordinatorModel {
        @Published var routes: Routes<Screen> = []

        init() {
            print("MainCoordinator.ViewModel.init")
            routes = [
                .root(.welcome)
            ]
        }

        func onFinishedWelcome() {
            routes = [
                .root(.tab)
            ]
        }
    }
}
