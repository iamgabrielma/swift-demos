//
//  ContentView.swift
//  Swift Demos
//
//  Created by Gabriel Maldonado Almendra on 23/6/24.
//

import SwiftUI

struct ContentView: View {
    @State private(set) var viewID = UUID()
    @StateObject private var stateObject = TestObject()
    @ObservedObject private var observedObject = TestObject()
    
    var body: some View {
        NavigationStack {
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

                Button("Recreate view") {
                    /*
                     When the proxy value specified by the id parameter changes (via .id() property),
                     then the identity of the view is reset.
                     */
                    viewID = UUID()
                }
                NavigationLink("Go to DetailView", destination: DetailView(stateObject: stateObject,
                                                                           observedObject: observedObject))
            }
            .id(viewID)
            .background(LifeCycleLogView(id: viewID, name: "ContentView") {
                EmptyView()
            })
        }
    }
}

#Preview {
    ContentView()
}
