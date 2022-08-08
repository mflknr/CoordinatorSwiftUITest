//
//  CoordinatorNavigationTestApp.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 26.07.22.
//

import SwiftUI

@main
struct CoordinatorNavigationTestApp: App {
    var body: some Scene {
        WindowGroup {
            MainCoordinator(viewModel: .init())
        }
    }
}
