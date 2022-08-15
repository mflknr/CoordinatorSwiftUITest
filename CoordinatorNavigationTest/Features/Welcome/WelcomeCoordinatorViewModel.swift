//
//  WelcomeCoordinator+ViewModel.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 08.08.22.
//

import SwiftUI
import FlowStacks

enum WelcomeCoordinatorScreen {
    case welcome
    case dataPrivacy
    case authentication
    case countrySelection
}

enum WelcomeCoordinatorIntent {
    case dataPrivacy
    case register
    case login
    case finish
}

class WelcomeCoordinatorViewModel: CoordinatorModel<WelcomeCoordinatorIntent, WelcomeCoordinatorScreen> {

    private let onFinishedWelcome: () -> Void

    init(onFinishedWelcome: @escaping () -> Void) {
        print("WelcomeCoordinator.ViewModel.init")
        self.onFinishedWelcome = onFinishedWelcome
        super.init(initialRoutes: [.root(.welcome)])
    }

    override func onIntent(_ intent: WelcomeCoordinatorIntent) {
        switch intent {
        case .dataPrivacy:
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                self?.routes.presentSheet(.dataPrivacy)
            }
        case .register:
            routes.presentCover(.authentication)
        case .login:
            routes.presentCover(.authentication)
        case .finish:
            onFinishedWelcome()
        }
    }
}
