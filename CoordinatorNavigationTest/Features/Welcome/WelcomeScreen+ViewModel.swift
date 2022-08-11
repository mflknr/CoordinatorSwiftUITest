//
//
// Created by __FULLUSERNAME__ on __DATE__.
// 
//

import SwiftUI

extension WelcomeScreen {
    class ViewModel: BaseViewModel {
        private let onRegister: () -> Void
        private let onLogin: () -> Void
        private let onWelcomeFinished: () -> Void

        init(
            onRegister: @escaping () -> Void,
            onLogin: @escaping () -> Void,
            onWelcomeFinished: @escaping () -> Void
        ) {
            self.onRegister = onRegister
            self.onLogin = onLogin
            self.onWelcomeFinished = onWelcomeFinished
        }

        func onRegisterButtonTap() {
            onRegister()
        }

        func onLoginButtonTap() {
            onLogin()
        }

        func onContinueAsGuest() {
            onWelcomeFinished()
        }
    }
}
