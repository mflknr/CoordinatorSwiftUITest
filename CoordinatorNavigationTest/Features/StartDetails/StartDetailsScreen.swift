//
//  StartDetailsScreen.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 07.08.22.
//

import SwiftUI

struct StartDetailsScreen: View {

    @ObservedObject var viewModel: StartDetailsScreenViewModel

    var body: some View {
        List {
            Section {
                ForEach(viewModel.state.chapters, id: \.self) { chapter in
                    Text(chapter)
                }
            } header: {
                Text(viewModel.state.headerText)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(viewModel.state.navigationTitle)
    }
}
