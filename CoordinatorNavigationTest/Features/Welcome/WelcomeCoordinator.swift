//
//  WhatsNewCoordinator.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 26.07.22.
//

import SwiftUI

struct WelcomeCoordinator: Coordinator {

    private let onFinishedWelcome: () -> Void

    init(onFinishedWelcome: @escaping () -> Void) {
        self.onFinishedWelcome = onFinishedWelcome
    }

    var body: some View {
        WelcomeScreen(onWelcomeFinished: {
            print("WelcomeCoordinator.onWelcomeFinished")
            onFinishedWelcome()
        })
    }
}
