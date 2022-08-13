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
                            viewModel.onIntent(.detailsTap(book))
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
            } header: {
                Text("Helper")
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(viewModel.state.navTitle)
        .onWillAppear(perform: viewModel.onViewWillAppear)
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
