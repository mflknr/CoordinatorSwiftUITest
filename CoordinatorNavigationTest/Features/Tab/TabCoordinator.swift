//
//  TabCoordinator.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 07.08.22.
//

import SwiftUI
import FlowStacks

struct TabCoordinator: Coordinator {

    @ObservedObject var viewModel: TabCoordinatorViewModel

    var body: some View {
        Router($viewModel.routes) { coordinator, _ in
            switch coordinator {
            case .tab:
                TabView(selection: $viewModel.selectedTab) {
                    StartCoordinator(viewModel: viewModel.startCoordinatorViewModel)
                        .tabItem {
                            Label("Start", systemImage: "list.dash")
                        }
                        .tag(Tab.start)

                    SettingsCoordinator()
                        .tabItem {
                            Label("Settings", systemImage: "square.and.pencil")
                        }
                        .tag(Tab.settings)
                }
            case .web:
                WebCoordinator()
            case .authentication:
                AuthenticationCoordinator()
            }
        }

    }
}
