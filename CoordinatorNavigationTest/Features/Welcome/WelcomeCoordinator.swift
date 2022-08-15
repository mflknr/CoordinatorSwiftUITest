//
//  WhatsNewCoordinator.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 26.07.22.
//

import SwiftUI
import FlowStacks

struct WelcomeCoordinator: Coordinator {

    @ObservedObject var viewModel: WelcomeCoordinatorViewModel

    var body: some View {
        Router($viewModel.routes) { screen, _ in
            switch screen {
            case .authentication:
                AuthenticationCoordinator()
            case .countrySelection:
                CountrySelectionView()
            case .dataPrivacy:
                DataPrivacyView()
            case .welcome:
                WelcomeScreen(
                    viewModel: .init(
                        onRegister: { viewModel.onIntent(.register) },
                        onLogin: { viewModel.onIntent(.login) },
                        onWelcomeFinished: { viewModel.onIntent(.finish) }
                    )
                )
            }
        }
        .onAppear {
            viewModel.onIntent(.dataPrivacy)
        }
    }
}
