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
        Router($viewModel.routes) { coordinator, _ in
            switch coordinator {
            case .tab:
                TabCoordinator(viewModel: .init())
            case .welcome:
                WelcomeCoordinator(onFinishedWelcome: viewModel.onFinishedWelcome)
            }
        }
    }
}
