//
//  CoordinatorNavigationTestApp.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 26.07.22.
//

import SwiftUI

@main
struct CoordinatorNavigationTestApp: App {

    @StateObject private var viewModel = MainCoordinatorViewModel()

    var body: some Scene {
        WindowGroup {
            MainCoordinator(viewModel: viewModel)
                .onOpenURL { url in
                    viewModel.onOpenUrl(url)
                }
        }
    }
}
