//
//  AnimationsView.swift
//  Swift Demos
//
//  Created by Gabriel Maldonado Almendra on 30/8/24.
//

import Foundation
import SwiftUI

struct AnimationsView: View {
    @State private var selected: Bool = false

    var body: some View {
        Rectangle()
            .frame(width: 100, height: 100)
            .scaleEffect(selected ? 2.0 : 1.0)
            .foregroundColor(selected ? .red : .blue)
            .onTapGesture {
                withAnimation {
                    selected.toggle()
                }
            }
    }
}
