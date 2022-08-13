//
//  CustomToggle.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 13.08.22.
//

import SwiftUI

struct CustomToggle: View {

    @State private var isOn: Bool = false

    let title: String
    let onValueChanged: (Bool) -> Void

    var body: some View {
        Toggle(title, isOn: $isOn)
            .onChange(of: isOn) { newValue in
                onValueChanged(newValue)
            }
    }
}
