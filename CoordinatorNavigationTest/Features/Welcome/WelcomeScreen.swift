//
//  WhatsNewScreen.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 26.07.22.
//

import SwiftUI

struct WelcomeScreen: View {

    private let onWelcomeFinished: () -> Void

    init(onWelcomeFinished: @escaping () -> Void) {
        self.onWelcomeFinished = onWelcomeFinished
    }

    var body: some View {
        ScrollView {
            Text("WelcomeScreen")
                .padding()
            Button("Resolve welcome") {
                onWelcomeFinished()
            }
        }
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen(onWelcomeFinished: {})
    }
}
