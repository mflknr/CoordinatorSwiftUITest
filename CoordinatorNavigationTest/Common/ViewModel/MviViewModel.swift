
import Foundation
import Combine
import CustomDump

protocol StatePublishingObject: ObservableObject {
    associatedtype State

    /// The global, immutable state of a given View, controlled exclusively by the ViewModel.
    ///
    /// To prevent corrupt states or state changes based on assumption of the old state, make
    /// sure to mark every setter of any given property of this state as private:
    /// ```
    /// struct State {
    ///     private(set) var stateProperty: String
    /// }
    /// ```
    ///
    /// SwiftUI provides many Views that uses two-way-binding (see: ``Toggle``). Since the state needs to be
    /// immutable, we need to circumvent any state changes into intents. For example, you might want to create
    /// a custom toggle:
    /// ```
    /// struct CustomToggle: View {
    ///
    ///     let title: String
    ///     let onValueChanged: (Bool) -> Void
    ///
    ///     @State private var isOn: Bool = false
    ///
    ///     var body: some View {
    ///         Toggle(title, isOn: $isOn)
    ///            .onChange(of: isOn) { newValue in
    ///                onValueChanged(newValue)
    ///             }
    ///     }
    /// }
    /// ```
    ///
    /// On call site you can now use the `onValueChange` callback to send an intent that you need:
    /// ```
    /// CustomToggle(title: "Title") { isOn in
    ///     viewModel.onIntent(.toggle(isOn))
    /// }
    /// ```
    ///
    /// - Note: The approach to use private setters on state properties can be opted out when dealing with small
    /// or uncorruptable state changes. Otherwise usage of the `Reducable` protocol is highly recommended.
    var state: State { get }

    /// Initialize all subscriptions within this method.
    ///
    ///  - Note: This methods gets autmatically called once the view needs its state.
    func initialize()
}

protocol Intentable {
    associatedtype Intent

    /// Called by the View to inform the ViewModel about a certain intent.
    func onIntent(_ intent: Intent)
}

class MviViewModel<Intent, State>: StatePublishingObject, Intentable {

    @Published var state: State
    private var oldState: State

    var cancellables = Set<AnyCancellable>()

    init(initialState: State) {
        self.state = initialState
        self.oldState = initialState
        $state
            .handleEvents(
                receiveSubscription: { [weak self] sub in
                    print("Receiving subscription: \(sub.combineIdentifier) - Calling initialize")
                    self?.initialize()
                },
                receiveOutput: { state in
                    if let diff = diff(self.oldState, state) {
                        print(diff)
                        self.oldState = state
                    }
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
