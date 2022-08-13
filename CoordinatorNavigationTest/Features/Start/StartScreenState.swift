import Foundation

struct StartScreenState: Reducable {
    private(set) var isLoading: Bool = false
    private(set) var hasError: Bool = false
    private(set) var detailsButtonText: String = "Zu den Details"
    private(set) var whatsNewButtonText: String = "Öffne WhatsNew"
    private(set) var navTitle: String = "Start"
    private(set) var books: [Book] = []
    private(set) var isActivated: Bool = false
    private(set) var onNavigationIntent: (StartNavigationIntent) -> Void

    mutating func reduce(_ partialState: PartialState) -> StartScreenState {
        switch partialState {
        case .isLoading:
            isLoading = true
            hasError = false

        case .loaded(let books):
            isLoading = false
            hasError = false
            self.books = books
        case .error:
            isLoading = false
            hasError = true
        case .toggle(let isOn):
            if isOn {
                detailsButtonText = "Keine Details da :("
                whatsNewButtonText = "Gibt es auch nicht mehr"
                navTitle = "NOT HOME"
            } else {
                detailsButtonText = "Zu den Details"
                whatsNewButtonText = "Öffne WhatsNew"
                navTitle = "Start"
            }
        }

        return self
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
