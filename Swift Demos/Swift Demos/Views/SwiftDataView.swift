//
//  SwiftDataView.swift
//  Swift Demos
//
//  Created by Gabriel Maldonado Almendra on 16/9/24.
//

import Foundation
import SwiftUI
import SwiftData

struct SwiftDataView: View {
    @Environment(\.modelContext) private var context
    @Query private var items: [Item]
    
    func addItem() {
        let item = Item(name: "An Item")
        context.insert(item)
    }

    var body: some View {
        VStack {
            Text("Experiments with SwiftData")
            Button(action: {
                addItem()
            }, label: {
                Text("Add item")
            })
            List {
                ForEach(items) { item in
                    VStack {
                        Text(item.name)
                        Text(item.id.uuidString)
                        if let modified = item.lastModified {
                            Text("Last modified: \(modified)")
                        }
                        Button(action: {
                            item.updateLastModified()
                        }, label: {
                            Text("Update")
                        })
                    }
                    .border(.blue, width: 1.0)
                }
            }
        }
    }
}
