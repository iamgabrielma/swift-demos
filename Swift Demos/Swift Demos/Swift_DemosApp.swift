//
//  Swift_DemosApp.swift
//  Swift Demos
//
//  Created by Gabriel Maldonado Almendra on 23/6/24.
//

import SwiftUI

enum Demo {
    case animations
    case stateComparison
    case taskExecution
}

@main
struct Swift_DemosApp: App {
    private let demo: Demo = .animations
    
    var body: some Scene {
        WindowGroup {
            switch demo {
            case .animations:
                AnimationsView()
            case .stateComparison:
                StateComparisonView()
            case .taskExecution:
                TaskExecutionView()
            }
        }
    }
}
