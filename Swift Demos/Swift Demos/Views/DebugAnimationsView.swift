//
//  DebugAnimationsView.swift
//  Swift Demos
//
//  Created by Gabriel Maldonado Almendra on 9/9/24.
//

import SwiftUI

public struct DebugAnimation: ViewModifier {
    @Binding var state: Bool
    @State private var progress: Double = 0

    public func body(content: Content) -> some View {
        let animation = Animation(ConstantAnimation(progress: progress))
        content
            // Inserting an implicit animation before the onChange call
            // fixes the issue of several animations being triggered at the
            // same time and overriding eachother
            .animation(animation, value: state)
            .onChange(of: progress) {
                state = false
                withAnimation(animation) {
                    state = true
                }
            }
            .overlay(alignment: .bottom) {
                Slider(value: $progress, in: 0...1)
                    .frame(width: 200, height: 40)
                    .alignmentGuide(.bottom, computeValue: { dimension in
                        dimension[.top]
                    })
            }
    }
}

struct DebugAnimationsView: View {
    @State private var toggle: Bool = false

    var body: some View {
        VStack {
            Rectangle()
                .fill(toggle ? Color.red : .blue)
                .frame(width: toggle ? 200 : 100, height: 200)
                .modifier(DebugAnimation(state: $toggle))
            Spacer()
        }
        .padding()
    }
}

/// CustomAnimation protocol: A type that defines how an animatable value changes over time
///
struct ConstantAnimation: CustomAnimation {
    var progress: Double

    // Calculates the value of the animation at specific time
    func animate<V>(value: V, time: TimeInterval, context: inout AnimationContext<V>) -> V? where V : VectorArithmetic {
        return value.scaled(by: progress)
    }
    
    // Determines wether different instances of an animation should be merged
    // to eachother
    func shouldMerge<V>(previous: Animation, value: V, time: TimeInterval, context: inout AnimationContext<V>) -> Bool where V : VectorArithmetic {
        return true
    }
}
