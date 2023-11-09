import UIKit

enum Currency: String {
    case usd, euro, thb
}
// Core Component
final class Payment: Payable {
    private let amount: Int
    private let currency: Currency
    
    init(amount: Int, currency: Currency) {
        self.amount = amount
        self.currency = currency
    }
    
    func getAmount() -> Int {
        amount
    }
    
    func getCurrency() -> String {
        currency.rawValue
    }
}

let payment = Payment(amount: 100, currency: .thb)
print("\(payment.getAmount())\(payment.getCurrency())")

/* 
- Decorator to dynamically modify the behavior of a core object without changing its existing class definition.
- Decorators do not simply modify behavior, but they do so dynamically. In other words, they change how objects work during run time instead of compile time.
*/

// 1. Create a Protocol to which the core object conforms to
protocol Payable {
    func getAmount() -> Int
    func getCurrency() -> String
}

// 2. Abstract decorator
class PaymentDecorator: Payable {
    // 2.1 Create private reference to the wrapped object
    // Since we need to hold a reference to the object we intend to decorate
    private let payable: Payable
    
    init(payable: Payable) {
        self.payable = payable
    }
    
    // 2.2 Since this is an abstract decorator, return the default value from the wrapped object implementation
    func getAmount() -> Int {
        payable.getAmount()
    }
    
    func getCurrency() -> String {
        payable.getCurrency()
    }
}

// 3. Concrete decorator
class NetPaymentDecorator: Payable {
    private let payable: Payable
    private let fees: Int
    
    init(payable: Payable, fees: Int) {
        self.payable = payable
        self.fees = fees
    }
    
    func getAmount() -> Int {
        payable.getAmount() - fees
    }
    
    func getCurrency() -> String {
        payable.getCurrency()
    }
}

let netPayment = NetPaymentDecorator(payable: payment, fees: 2)
print("Net payment: \(netPayment.getAmount())\(netPayment.getCurrency())")

// 4. Decorating decorators
class CentsPaymentDecorator: Payable {
    private let payable: Payable
    private let fees: Int
    
    init(payable: Payable, fees: Int) {
        self.payable = payable
        self.fees = fees
    }
    
    func getAmount() -> Int {
        payable.getAmount() * 100
    }
    
    func getCurrency() -> String {
        "cents" + payable.getCurrency()
    }
}

let paymentInCents = CentsPaymentDecorator(payable: PaymentDecorator(payable: payment), fees: 0)
print("Cents: \(paymentInCents.getAmount())\(paymentInCents.getCurrency())")

let netPaymentInCents = CentsPaymentDecorator(payable: NetPaymentDecorator(payable: payment, fees: 2),
                                              fees: 0)
print("Net in cents: \(netPaymentInCents.getAmount())\(netPaymentInCents.getCurrency())")
