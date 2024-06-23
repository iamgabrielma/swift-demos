//
//  TaskExecutionView.swift
//  Swift Demos
//
//  Created by Gabriel Maldonado Almendra on 23/6/24.
//

import SwiftUI

struct TaskExecutionView: View {
    @ObservedObject private var tasker: Tasker = Tasker()

    var body: some View {
        HStack {
            VStack {
                Text(tasker.sequential)
                Button("Tap for sequential task") {
                    Task {
                        // For 2 tasks or 2 and 4 seconds takes approx ~6-7 seconds.
                        // The sum of all tasks duration
                        try await tasker.runSequentially()
                    }
                }
            }
            VStack {
                Text(tasker.parallel)
                Button("Tap for parallel task") {
                    Task {
                        // For 2 tasks or 2 and 4 seconds takes approx ~4 seconds.
                        // The longest task duration
                        try await tasker.runParallely()
                    }
                }
            }
        }
    }
}
