//
//  LifeCycleLogView.swift
//  Swift Demos
//
//  Created by Gabriel Maldonado Almendra on 23/6/24.
//

import SwiftUI

struct LifeCycleLogView<Content: View>: View {
    let id: UUID
    let name: String
    let content: () -> Content
    
    init(id: UUID, name: String, @ViewBuilder content: @escaping () -> Content) {
        self.id = id
        self.name = name
        self.content = content
        debugPrint("LifeCycleLogView: \(name) allocated with id: \(id)")
    }
    
    var body: some View {
        content()
            .onAppear {
                debugPrint("LifeCycleLogView for \(name) appear with id: \(id)")
            }
            .onDisappear {
                debugPrint("LifeCycleLogView for \(name) disappear with id: \(id)")
            }
    }
}
