//
//  DetailView.swift
//  Swift Demos
//
//  Created by Gabriel Maldonado Almendra on 23/6/24.
//

import SwiftUI

struct DetailView: View {
    @State private(set) var viewID = UUID()
    @ObservedObject var stateObject: TestObject
    @ObservedObject var observedObject: TestObject
    
    init(stateObject: TestObject, observedObject: TestObject) {
        self.stateObject = stateObject
        self.observedObject = observedObject
    }
    
    var body: some View {
        
        Text("Detail View")
        VStack {
            HStack {
                Text("Value: \(stateObject.value)")
                Text("Value: \(observedObject.value)")
            }
            HStack {
                Button("Increment") {
                    stateObject.incrementValue()
                }
                Button("Increment") {
                    observedObject.incrementValue()
                }
            }
        }
            .background(LifeCycleLogView(id: viewID, name: "DetailView") {
                EmptyView()
            })
    }
}
