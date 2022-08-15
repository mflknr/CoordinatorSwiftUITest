//
//  CoordinatorModel.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 08.08.22.
//

import Foundation
import Combine
import FlowStacks
import CustomDump

protocol Routable {
    associatedtype Screen
    var routes: Routes<Screen> { get }
}

class CoordinatorModel<Intent, Screen>: ObservableObject, Routable, Intentable {

    @Published var routes: Routes<Screen>
    private var oldRoutes: Routes<Screen>?
    private var cancellable = Set<AnyCancellable>()

    init(initialRoutes: Routes<Screen> = []) {
        self.routes = initialRoutes
        logRouteChanges()
    }

    func onIntent(_ intent: Intent) {
        fatalError("Missin override")
    }

    private func logRouteChanges() {
        $routes
            .handleEvents(
                receiveOutput: { [weak self] newRoutes in
                    let diffableRoutes = newRoutes.map({ String(reflecting: $0.screen) })
                    if let diffableOldRoutes = self?.oldRoutes?.map({ String(reflecting: $0.screen) }),
                       let diff = diff(diffableOldRoutes, diffableRoutes) {
                        print("** NEW ROUTE **")
                        print(diff)
                        self?.oldRoutes = newRoutes
                    }
                }
            )
            .sink { _ in return }
            .store(in: &cancellable)
    }
}
