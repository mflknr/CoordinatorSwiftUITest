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
            print("MainCoordinator.ViewModel.init")
            if userFinishedWelcome {
                showTabAsRoot()
            } else {
                routes = [
                    .root(.welcome)
                ]
            }

        }

        func onFinishedWelcome() {
            userFinishedWelcome = true
            showTabAsRoot()
        }

        private func showTabAsRoot() {
            routes = [
                .root(.tab)
            ]
        }
    }
}
