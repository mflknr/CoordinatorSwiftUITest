import Foundation

struct StartDetailsScreenState: Reducable {
    private(set) var navigationTitle: String
    private(set) var headerText: String = "Chapter"
    private(set) var book: Book
    private(set) var isLoading: Bool = false
    private(set) var chapters: [String] = []

    mutating func reduce(_ partialState: PartialState) {
        switch partialState {
        case .isLoading:
            isLoading = true
        case .error:
            isLoading = false
        case .loaded(let newChapters):
            isLoading = false
            chapters = newChapters
        }
    }
}

extension StartDetailsScreenState {
    enum PartialState {
        case error
        case isLoading
        case loaded([String])
    }
}
