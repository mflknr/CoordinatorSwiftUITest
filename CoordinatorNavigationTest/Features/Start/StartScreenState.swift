//
//  StartScreenState.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 27.07.22.
//

import Foundation

struct StartScreenState: Reducable {
    private(set) var isLoading: Bool = false
    private(set) var hasError: Bool = false
    private(set) var detailsButtonText: String = "Zu den Details"
    private(set) var whatsNewButtonText: String = "Öffne WhatsNew"
    private(set) var navTitle: String = "Start"
    private(set) var books: [Book] = []
    private(set) var isActivated: Bool = false
    private(set) var onNavigationIntent: (StartCoordinatorIntent) -> Void

    func reduce(_ partialState: PartialState) -> StartScreenState {
        var newState = self
        switch partialState {
        case .isLoading:
            newState.isLoading = true
            newState.hasError = false

        case .loaded(let books):
            newState.isLoading = false
            newState.hasError = false
            newState.books = books

        case .error:
            newState.isLoading = false
            newState.hasError = true
            
        case .toggle(let isOn):
            if isOn {
                newState.detailsButtonText = "Keine Details da :("
                newState.whatsNewButtonText = "Gibt es auch nicht mehr"
                newState.navTitle = "NOT HOME"
            } else {
                newState.detailsButtonText = "Zu den Details"
                newState.whatsNewButtonText = "Öffne WhatsNew"
                newState.navTitle = "Start"
            }
        }

        return newState
    }
}

extension StartScreenState {
    enum PartialState {
        case isLoading
        case loaded([Book])
        case error
        case toggle(Bool)
    }
}
