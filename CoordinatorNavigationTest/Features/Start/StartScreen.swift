//
//  StartScreen.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 26.07.22.
//

import SwiftUI

struct StartScreen: View {

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        Form {
            Section {
                Text(viewModel.detailsButtonText)
                    .onTapGesture {
                        viewModel.onDetailsButton()
                    }
                Text(viewModel.whatsNewButtonText)
                    .onTapGesture {
                        viewModel.onWhatsNewTriggered()
                    }
            } header: {
                Text("Deine Möglichkeiten heute")
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(viewModel.navTitle)
    }
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen(viewModel: .init(onNavigationIntent: {_ in}))
    }
}
