# Swift demos
Collection of bits of Swift code, and experimentation demos.

## Animations
- .withAnimation
- .phaseAnimator
- Debugging animations (SwiftTalk #405)

## Concurrency
- `TaskExecutionView`: Time comparison between `sequential` and `parallel` task execution

## Patterns
- Decorator: Dynamically modifies the behavior of a core object without changing its existing class definition. It changes how objects work during run-time.
- Observer: In `swiftui-view-viewmodel-states` we're using `@ObservableObject`, `@ObservedObject`, and `@Published` as a communication mechanism for state and data flow within SwiftUI applications

## Persistence
- SwiftData: Creates, and inserts `Item` models into disk, and allows to update its properties.
- [] In-memory persistence
- [] URLCache and NSCache usage

## State
- StateObject vs ObservableObject for viewmodels: Understanding the differences between a view owning its `@StateObject`, but something else owning (and managing) an `@ObservedObject`.
- Passing state between views: In `swiftui-passing-state-between-views` we're using `@Binding` and `@State` in order to have 2-way communication between child and parent views
