//
//  Swift_DemosApp.swift
//  Swift Demos
//
//  Created by Gabriel Maldonado Almendra on 23/6/24.
//

import SwiftUI

enum Demo {
    case animations
    case debugAnimations
    case stateComparison
    case taskExecution
}

@main
struct Swift_DemosApp: App {
    private let demo: Demo = .debugAnimations
    
    var body: some Scene {
        WindowGroup {
            switch demo {
            case .animations:
                AnimationsView()
            case .debugAnimations:
                DebugAnimationsView()
            case .stateComparison:
                StateComparisonView()
            case .taskExecution:
                TaskExecutionView()
            }
        }
    }
}
