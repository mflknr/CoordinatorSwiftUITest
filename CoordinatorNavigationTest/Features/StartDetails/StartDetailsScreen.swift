//
//  StartDetailsScreen.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 07.08.22.
//

import SwiftUI

struct StartDetailsScreen: View {

    @ObservedObject var viewModel: StartDetailsScreen.ViewModel

    var body: some View {
        ScrollView {
            Text("Content für die StartDetails")
                .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(viewModel.navigationTitle)
    }
}

extension StartDetailsScreen {
    class ViewModel: BaseViewModel {
        let navigationTitle: String
        init() {
            self.navigationTitle = ""
        }
    }
}
