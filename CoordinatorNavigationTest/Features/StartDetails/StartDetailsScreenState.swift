import Foundation

struct StartDetailsScreenState: Reducable {
    let navigationTitle: String
    let headerText: String = "Chapter"
    let book: Book
    let isLoading: Bool
    var chapters: [String]

    init(
        book: Book,
        isLoading: Bool = false,
        chapters: [String] = []
    ) {
        self.navigationTitle = book.name
        self.book = book
        self.isLoading = isLoading
        self.chapters = chapters
    }

    func reduce(_ partialState: PartialState) -> StartDetailsScreenState {
        switch partialState {
        case .isLoading:
            return .init(
                book: book,
                isLoading: true,
                chapters: chapters
            )
        case .error:
            return .init(
                book: book,
                isLoading: false,
                chapters: chapters
            )
        case .loaded(let chapters):
            return .init(
                book: book,
                isLoading: false,
                chapters: chapters
            )
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
