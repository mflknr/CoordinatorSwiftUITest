import Foundation

class StartDetailsScreenViewModel: MviViewModel<StartDetailsScreenIntent, StartDetailsScreenState> {

    private let repository = OneApiRepository()

    override func initialize() {
        repository
            .getChapters()
            .receive(on: RunLoop.main)
            .sink { completion in
                print(completion)
            } receiveValue: { [weak self] chapters in
                guard let self = self, let chapters = chapters else { return }
                self.state = self.state.reduce(.loaded(chapters))
            }
            .store(in: &cancellables)

    }

    override func onIntent(_ intent: StartDetailsScreenIntent) {
        switch intent {
        case .willAppear:
            self.state = self.state.reduce(.isLoading)
            repository.fetchChapters(by: state.book.bookId)
        }
    }
}
