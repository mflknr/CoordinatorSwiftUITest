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
                Text(viewModel.whatsNewButtonText)

            } header: {
                Text("Deine Möglichkeiten heute")
            }

            Section {
                ForEach(viewModel.books) { book in
                    Text(book.name)
                        .onTapGesture {
                            viewModel.onDetailsTap(book)
                        }
                }
            } header: {
                Text("Books")
            }

            Section {
                Button("Reset Welcome") {
                    UserDefaults.standard.removeObject(forKey: "kUserFinishedWelcome")
                }
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(viewModel.navTitle)
        .onAppear(perform: viewModel.onAppear)
    }
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen(viewModel: .init(onNavigationIntent: {_ in}))
    }
}
