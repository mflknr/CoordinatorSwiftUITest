
import Foundation
import Combine

protocol StateRepresentable {
    associatedtype State

    /// State of the view.
    var state: State { get }

    /// Initialize all subscriptions within this method.
    ///  - Note: This methods gets autmatically called once the view needs its state.
    func initialize()
}

protocol IntentRepresentable {
    associatedtype Intent

    /// Called by the View to inform the ViewModel about a certain intent.
    func onIntent(_ intent: Intent)
}

class MviViewModel<Intent, State>: ObservableObject, StateRepresentable, IntentRepresentable {

    @Published var state: State

    var cancellables = Set<AnyCancellable>()

    init(initialState: State) {
        self.state = initialState
        $state
            .handleEvents(
                receiveSubscription: { [weak self] sub in
                    print("Receiving subscription: \(sub.combineIdentifier)")
                    print("Calling initialize")
                    self?.initialize()
                },
                receiveOutput: { state in
                    print("New State: \(type(of: state))")
                }
            )
            .sink(receiveValue: {_ in})
            .store(in: &cancellables)
    }

    func initialize() {
        fatalError("Missing Override")
    }

    func onIntent(_ intent: Intent) {
        fatalError("Missing Override")
    }
}
