import UIKit
import SwiftUI
import PlaygroundSupport

enum AppState: String, CaseIterable {
    case none
    case loading
    case loaded
    case error
}

class SomeViewModel: ObservableObject {
    /*
     Remember to mark the state we want to expose as @Published!
     Otherwise we're not publishing changes for SwiftUi to can recognize them.
     Once marked, whenever the property changes SwiftUI will be notified.
     
     @Published marks the property whose changes should be observed, when this changes
     SwiftUI will automatically recompute the views that depend on it.
     */
    @Published private(set) var state: AppState = .none
    
    func runRecursively() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            self.state = AppState.allCases.randomElement() ?? .error
            self.runRecursively()
        })
    }
}

struct SomeView: View {
    @ObservedObject private var viewModel: SomeViewModel
    
    init(viewModel: SomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Text("State: \(viewModel.state.rawValue)")
        }
        .frame(width: 150, height: 50)
        .onAppear {
            viewModel.runRecursively()
        }
        
    }
}

PlaygroundPage.current.setLiveView(SomeView(viewModel: SomeViewModel()))
PlaygroundPage.current.needsIndefiniteExecution = true
