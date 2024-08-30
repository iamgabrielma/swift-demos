//
//  AnimationsView.swift
//  Swift Demos
//
//  Created by Gabriel Maldonado Almendra on 30/8/24.
//

import Foundation
import SwiftUI

struct AnimationsView: View {
    var body: some View {
        VStack {
            TappableAnimatedRectangleView()
            BlinkingTextView()
        }
    }
}

struct TappableAnimatedRectangleView: View {
    @State private var selected: Bool = false

    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 100, height: 100)
                .scaleEffect(selected ? 2.0 : 1.0)
                .foregroundColor(selected ? .red : .blue)
                .onTapGesture {
                    withAnimation {
                        selected.toggle()
                    }
                }
            Text("Tap me")
        }
    }
}

struct BlinkingTextView: View {
    var body: some View {
        Text("This is some blinking text!")
            .phaseAnimator([false, true]) { content, phase in
                content
                    .foregroundStyle(phase ? .red : .primary)
                    .opacity(phase ? 1.0 : 0.5)
            } animation: { phase in
                // By default SwiftUI uses `.spring`, but we can add an animation closure
                // and change this:
                    .easeInOut(duration: 1.0)
            }
    }
}
