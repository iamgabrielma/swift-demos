//
//  Tasker.swift
//  Swift Demos
//
//  Created by Gabriel Maldonado Almendra on 23/6/24.
//

import SwiftUI

@MainActor
final class Tasker: ObservableObject {
    @Published private(set) var sequential: String = "0"
    @Published private(set) var parallel: String = "0"
    
    func simulateTask(taskNumber: Int, duration: TimeInterval) async throws {
        debugPrint("Task \(taskNumber) started.")
        try await Task.sleep(nanoseconds: UInt64(duration * 1_000_000_000))
        debugPrint("Task \(taskNumber) completed.")
    }
    
    func runSequentially() async throws {
        let start = Date()
        try await simulateTask(taskNumber: 1, duration: 2)
        try await simulateTask(taskNumber: 2, duration: 4)

        let end = Date()
        let timeInterval = end.timeIntervalSince(start)
        
        debugPrint("Sequential execution: \(timeInterval)")
        let uiFriendlyTimeInterval = String(format: "%.6f seconds", timeInterval)
        sequential = uiFriendlyTimeInterval
    }

    func runParallely() async throws {
        let start = Date()
        async let task1: () = simulateTask(taskNumber: 1, duration: 2)
        async let task2: () = simulateTask(taskNumber: 2, duration: 4)
        try await task1
        try await task2
        
        let end = Date()
        let timeInterval = end.timeIntervalSince(start)

        debugPrint("Parallel execution: \(timeInterval)")
        let uiFriendlyTimeInterval = String(format: "%.6f seconds", timeInterval)
        parallel = uiFriendlyTimeInterval
        
    }
    
    func main() async throws {
        try await runSequentially()
        try await runParallely()
    }
}
