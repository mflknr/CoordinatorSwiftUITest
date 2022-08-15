//
//  MainCoordinator.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 26.07.22.
//

// Inspired from here: https://stackoverflow.com/questions/64812770/swiftuis-onappear-and-ondisappear-called-multiple-times-and-inconsistently

import SwiftUI

public extension View {
    func onWillAppear(perform: @escaping () -> Void) -> some View {
        self.background(OnViewWillAppear(action: perform))
    }
}

public protocol ActionDelegate: AnyObject {
    func act()
}

public struct OnViewWillAppear: UIViewControllerRepresentable {

    // MARK: - Properties

    let action: () -> Void

    // MARK: - Init

    public init(action: @escaping () -> Void) {
        self.action = action
    }

    // MARK: - UIViewRepresentable

    public func makeUIViewController(context: Context) -> WillAppearViewController {
        let vc = WillAppearViewController()
        vc.delegate = context.coordinator
        return vc
    }

    public func updateUIViewController(_ controller: WillAppearViewController, context: Context) {}

    public func makeCoordinator() -> Coordinator {
        Coordinator(action: self.action)
    }

    public class Coordinator: ActionDelegate {

        var action: () -> Void

        // MARK: - Init

        public init(action: @escaping () -> Void) {
            self.action = action
        }

        public func act() {
            action()
        }
    }
}

public class WillAppearViewController: UIViewController {

    // MARK: - Properties

    public weak var delegate: ActionDelegate?

    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        delegate?.act()
    }
}
