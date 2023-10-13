import UIKit
import SwiftUI
import PlaygroundSupport

final class EditableOrderViewModel {
    
    private(set) var paymentDataViewModel = PaymentDataViewModel()
    
    init(paymentDataViewModel: PaymentDataViewModel) {
        self.paymentDataViewModel = paymentDataViewModel
    }

    struct PaymentDataViewModel {
        var shouldShowCouponsInfoTooltip: Bool = false
        
        init(shouldShowCouponsInfoTooltip: Bool = false) {
            self.shouldShowCouponsInfoTooltip = shouldShowCouponsInfoTooltip
        }
    }
}

struct OrderForm: View {
    
    // 3. Instead of having the @State in OrderPaymentSection, this is moved here,
    // then we pass the value dow via $shouldShowInformationalCouponTooltip
    @State private var shouldShowInformationalCouponTooltip = false
    
    var body: some View {
        Text("Order")
        OrderPaymentSection(viewModel: EditableOrderViewModel.PaymentDataViewModel(),
                            shouldShowCouponsInfoTooltip: $shouldShowInformationalCouponTooltip)
        .onTapGesture {
            // 4. Since we're now declaring the state or sub-components in this parent view, we can tap anywhere to perform logic
            // that will affect the sub-views, since we're modifying state and passing it down. In this case tapping anywhere
            // will hide the tooltip if was being shown
            if shouldShowInformationalCouponTooltip {
                shouldShowInformationalCouponTooltip = false
            }
        }
    }
}

struct OrderPaymentSection: View {
    // 1. We can't declare the type directly since it's inside EditableOrderViewModel
    let viewModel: EditableOrderViewModel.PaymentDataViewModel
    
    @Binding private var shouldShowCouponsInfoTooltip: Bool
    
    init(viewModel: EditableOrderViewModel.PaymentDataViewModel, shouldShowCouponsInfoTooltip: Binding<Bool> ) {
        self.viewModel = viewModel
        self._shouldShowCouponsInfoTooltip = shouldShowCouponsInfoTooltip
    }
    
    var body: some View {
        Text("Order Payment Section")
        EmptyView()
        Button("Tap me") {
            // 2. When tapping the button, we toggle shouldShowCouponsInfoTooltip and render the Rectangle
            // Problem to solve: How to dismiss the rectangle when we tap anywhere else within the view?
            // We pass the value for shouldShowCouponsInfoTooltip from the parent and use a @Binding rather than @State
            shouldShowCouponsInfoTooltip.toggle()
            
        }
        if shouldShowCouponsInfoTooltip {
            Rectangle().fill(.red).frame(width: 50, height: 50)
        }
    }
}

PlaygroundPage.current.setLiveView(OrderForm())
PlaygroundPage.current.needsIndefiniteExecution = true
