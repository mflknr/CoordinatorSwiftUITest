//
//  StartScreenViewModel.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 27.07.22.
//

import SwiftUI

extension StartScreen {
    class ViewModel: BaseViewModel {
        @Published var detailsButtonText = "Zu den Details"
        @Published var whatsNewButtonText = "Öffne WhatsNew"
        @Published var navTitle = "Start"

        private let onNavigationIntent: (StartCoordinator.NavigationIntent) -> Void

        init(onNavigationIntent: @escaping (StartCoordinator.NavigationIntent) -> Void) {
            print("StartScreen.ViewModel.Init")
            self.onNavigationIntent = onNavigationIntent
        }

        func onDetailsButton() {
            onNavigationIntent(.onDetailsTapped)
        }

        func onWhatsNewTriggered() {
            onNavigationIntent(.onWhatsNewTriggered)
        }
    }
}
