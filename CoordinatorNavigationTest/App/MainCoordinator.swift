//
//  MainCoordinator.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 26.07.22.
//

import SwiftUI
import FlowStacks

struct MainCoordinator: Coordinator {

    @ObservedObject var viewModel: MainCoordinatorViewModel

    var body: some View {
        Router($viewModel.routes) { coordinator, _ in
            switch coordinator {
            case .tab(let viewModel):
                TabCoordinator(viewModel: viewModel)
            case .welcome(let viewModel):
                WelcomeCoordinator(
                    viewModel: viewModel
                )
            }
        }
    }
}
