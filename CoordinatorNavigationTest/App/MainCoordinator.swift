//
//  MainCoordinator.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 26.07.22.
//

import SwiftUI
import FlowStacks

struct MainCoordinator: Coordinator {

    @ObservedObject var viewModel: MainCoordinator.ViewModel

    var body: some View {
        Router($viewModel.routes) { screen, _ in
            switch screen {
            case .tab:
                TabCoordinator()
            case .welcome:
                WelcomeCoordinator(onFinishedWelcome: viewModel.onFinishedWelcome)
            }
        }
    }
}
