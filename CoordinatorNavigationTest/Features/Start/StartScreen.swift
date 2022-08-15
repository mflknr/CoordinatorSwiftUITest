//
//  StartScreen.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 26.07.22.
//

import SwiftUI

struct StartScreen: View {

    @ObservedObject var viewModel: StartScreenViewModel

    var body: some View {
        Form {
            Section {
                Text(viewModel.state.detailsButtonText)
                Text(viewModel.state.whatsNewButtonText)
            } header: {
                Text("Deine Möglichkeiten heute")
            }

            Section {
                ForEach(viewModel.state.books) { book in
                    Text(book.name)
                        .onTapGesture {
                            viewModel.onIntent(.showDetails(book))
                        }
                }
            } header: {
                Text("Books")
            }

            Section {
                CustomToggle(title: "Custom Toggle for intents") { isOn in
                    viewModel.onIntent(.toggle(isOn))
                }
                Button("Reset Welcome") {
                    viewModel.onIntent(.resetTap)
                }
                Button("Show a WebView") {
                    viewModel.onIntent(.showWeb)
                }
                Button("Show Authentication") {
                    viewModel.onIntent(.showAuth)
                }
            } header: {
                Text("Helper")
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(viewModel.state.navTitle)
    }
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen(
            viewModel: .init(
                initialState: .init(
                    onNavigationIntent: {_ in}
                )
            )
        )
    }
}
