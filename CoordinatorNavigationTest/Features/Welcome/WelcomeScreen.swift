//
//  WhatsNewScreen.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 26.07.22.
//

import SwiftUI

struct WelcomeScreen: View {

    @ObservedObject var viewModel: WelcomeScreenViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 16.0) {
                Text("WelcomeScreen")
                    .padding()

                Button("Register", action: viewModel.onRegisterButtonTap)
                Button("Login", action: viewModel.onLoginButtonTap)
                Button("Continue as Guest", action: viewModel.onContinueAsGuest)
            }
        }
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen(
            viewModel: .init(
                onRegister: {},
                onLogin: {},
                onWelcomeFinished: {}
            )
        )
    }
}
