//
//  WelcomeCoordinator+ViewModel.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 08.08.22.
//

import SwiftUI
import FlowStacks

extension WelcomeCoordinator {
    class ViewModel: CoordinatorModel {
        enum Screen {
            case welcome
            case dataPrivacy
            case authentication
            case countrySelection
        }

        @Published var routes: Routes<Screen> = []

        init() {
            routes = [.root(.welcome)]
        }
    }
}
