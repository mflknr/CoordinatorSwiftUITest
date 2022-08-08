//
//  TabCoordinator.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 07.08.22.
//

import SwiftUI

struct TabCoordinator: Coordinator {
    enum Tab: Int {
        case start = 0
        case settings
    }

    @ObservedObject var viewModel: TabCoordinator.ViewModel
    @State private var selectedTab: Tab = .start

    var body: some View {
        TabView(selection: $selectedTab) {
            StartCoordinator(
                viewModel: .init(
                    onWhatsNewTriggered: {
                        print("StartCoordinator.ViewModel(onWhatsNewTriggered")
                    }
                )
            )
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
    }
}
