//
//  StartCoordinator.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 26.07.22.
//

import SwiftUI
import FlowStacks

struct StartCoordinator: Coordinator {

    @ObservedObject var viewModel: StartCoordinatorViewModel

    var body: some View {
        Router($viewModel.routes) { screen, _ in
            switch screen {
            case .start(let viewModel):
                StartScreen(viewModel: viewModel)
            case .startDetails(let viewModel):
                StartDetailsScreen(viewModel: viewModel)
            }
        }
    }
}
