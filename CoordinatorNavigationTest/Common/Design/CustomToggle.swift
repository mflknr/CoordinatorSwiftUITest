//
//  CustomToggle.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 13.08.22.
//

import SwiftUI

struct CustomToggle: View {

    let title: String
    let onValueChanged: (Bool) -> Void

    @State private var isOn: Bool = false

    var body: some View {
        Toggle(title, isOn: $isOn)
            .onChange(of: isOn) { newValue in
                onValueChanged(newValue)
            }
    }
}
