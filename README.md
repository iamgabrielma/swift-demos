# Swift demos
Collection of bits of Swift code, and experimentation demos.

### Decorator Pattern

Dynamically modifies the behavior of a core object without changing its existing class definition. It changes how objects work during run-time.

### Observer Pattern
`swiftui-view-viewmodel-states`

We're using @ObservableObject, @ObservedObject, and @Published as a communication mechanism for state and data flow within SwiftUI applications

### Passing state between views
`swiftui-passing-state-between-views`

Using `@Binding` and `@State` in order to have 2-way communication between child and parent views. In this case resolves the case for: 
1. Tapping a button renders a child view
2. Tapping anywhere in the child view or the parent view hides the child view 
