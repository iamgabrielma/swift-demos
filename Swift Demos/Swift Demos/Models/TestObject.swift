//
//  TestObject.swift
//  Swift Demos
//
//  Created by Gabriel Maldonado Almendra on 23/6/24.
//
import SwiftUI

final class TestObject: ObservableObject {
    @Published private(set) var viewModelID = UUID()
    @Published private(set) var value: Int = 0
    
    init() {
        debugPrint("TestObject allocated with id: \(viewModelID)")
    }

    func incrementValue() {
        value += 1
    }

    deinit {
        debugPrint("TestObject deallocated with id: \(viewModelID)")
    }
    
}
