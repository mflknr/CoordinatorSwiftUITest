//
//  TabCoordinator+ViewModel.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 07.08.22.
//

import SwiftUI
import FlowStacks

extension TabCoordinator {
    class ViewModel: ObservableObject {
        @Published var routes: Route<>
    }
}
