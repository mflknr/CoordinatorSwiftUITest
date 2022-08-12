import Foundation

struct StartScreenState: Reducable {
    let isLoading: Bool
    let hasError: Bool
    let detailsButtonText: String
    let whatsNewButtonText: String
    let navTitle: String
    let books: [Book]
    let onNavigationIntent: (StartNavigationIntent) -> Void

    init(
        isLoading: Bool = false,
        hasError: Bool = false,
        detailsButtonText: String = "Zu den Details",
        whatsNewButtonText: String = "Öffne WhatsNew",
        navTitle: String = "Start",
        books: [Book] = [],
        onNavigationIntent: @escaping (StartNavigationIntent) -> Void
    ) {
        self.isLoading = isLoading
        self.hasError = hasError
        self.detailsButtonText = detailsButtonText
        self.whatsNewButtonText = whatsNewButtonText
        self.navTitle = navTitle
        self.books = books
        self.onNavigationIntent = onNavigationIntent
    }

    func reduce(_ partialState: PartialState) -> StartScreenState {
        switch partialState {
        case .isLoading:
            return StartScreenState(
                isLoading: true,
                hasError: false,
                onNavigationIntent: self.onNavigationIntent
            )
        case .loaded(let books):
            return StartScreenState(
                isLoading: false,
                hasError: false,
                books: books,
                onNavigationIntent: self.onNavigationIntent
            )
        case .error:
            return StartScreenState(
                isLoading: false,
                hasError: true,
                books: self.books,
                onNavigationIntent: self.onNavigationIntent
            )
        case .whatsNew:
            return StartScreenState(
                detailsButtonText: "Keine Details da :(",
                whatsNewButtonText: "Gibt es auch nicht mehr",
                navTitle: "NOT HOME",
                books: self.books,
                onNavigationIntent: self.onNavigationIntent
            )
        }
    }
}

extension StartScreenState {
    enum PartialState {
        case isLoading
        case loaded([Book])
        case error
        case whatsNew
    }
}
