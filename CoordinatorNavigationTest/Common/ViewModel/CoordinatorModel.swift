//
//  CoordinatorModel.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 08.08.22.
//

import Combine
import FlowStacks
import CustomDump

protocol Routable {
    associatedtype Screen
    var routes: Routes<Screen> { get }
}

class CoordinatorModel<Intent, Screen>: ObservableObject, Routable {

    @Published var routes: Routes<Screen>
    private var oldRoutes: Routes<Screen>
    private var cancellable = Set<AnyCancellable>()

    init(initialRoutes: Routes<Screen>) {
        self.routes = initialRoutes
        self.oldRoutes = initialRoutes
        $routes
            .handleEvents(
                receiveOutput: { [weak self] routes in
                    if let routes = self?.routes,
                       let oldRoutes = self?.oldRoutes,
                       let diff = diff(oldRoutes, routes) {
                        print(diff)
                    }
                })
            .sink { _ in
                //
            }
            .store(in: &cancellable)
    }

    func onIntent(_ intent: Intent) {
        fatalError("override missing")
    }
}
