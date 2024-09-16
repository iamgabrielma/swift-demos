//
//  Item.swift
//  Swift Demos
//
//  Created by Gabriel Maldonado Almendra on 16/9/24.
//

import Foundation
import SwiftData

@Model
class Item: Identifiable {
    let id: UUID
    let name: String
    private let createdOn: Date
    private(set) var lastModified: Date?
    
    init(name: String) {
        self.id = UUID()
        self.name = name
        self.createdOn = Date()
    }
    
    func updateLastModified() {
        self.lastModified = Date()
    }
}
