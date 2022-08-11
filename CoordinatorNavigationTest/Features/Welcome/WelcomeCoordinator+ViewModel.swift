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

        private let onFinishedWelcome: () -> Void

        init(onFinishedWelcome: @escaping () -> Void) {
            print("WelcomeCoordinator.ViewModel.init")
            self.onFinishedWelcome = onFinishedWelcome
            routes = [.root(.welcome)]
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                self?.routes.presentSheet(.dataPrivacy)
            }
        }

        func onRegister() {
            routes.presentCover(.authentication)
        }

        func onLogin() {
            routes.presentCover(.authentication)
        }

        func onFinish() {
            print("WelcomeCoordinator.ViewModel.onWelcomeFinished")
            onFinishedWelcome()
        }
    }
}
