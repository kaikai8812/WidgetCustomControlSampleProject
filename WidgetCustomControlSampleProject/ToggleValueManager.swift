import Foundation

import Foundation

class ToggleValueManager {
    static let shared = ToggleValueManager()
    
    private var toggleState: Bool = false {
        didSet {
            NotificationCenter.default.post(name: .toggleValueChanged, object: nil)
        }
    }
    
    private init() {}
    
    func getToggleState() -> Bool {
        return toggleState
    }
    
    func setToggleState(to newState: Bool) {
        toggleState = newState
    }
    
    func toggle() {
        toggleState = !toggleState
    }
}


import Combine

class ToggleValueWrapper: ObservableObject {
    @Published var toggleState: Bool = ToggleValueManager.shared.getToggleState()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // Monitor changes in the ToggleValueManager
        NotificationCenter.default.publisher(for: .toggleValueChanged)
            .sink { [weak self] _ in
                self?.toggleState = ToggleValueManager.shared.getToggleState()
            }
            .store(in: &cancellables)
    }
}

extension Notification.Name {
    static let toggleValueChanged = Notification.Name("toggleValueChanged")
}
