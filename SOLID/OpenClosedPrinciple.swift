//
//  OpenClosedPrinciple.swift
//  SOLID
//
//  Created by Md Khaled Hasan Manna on 17/12/22.
//

import Foundation

/*
 Open Closed Principle:
 Open for extension But Closed for modification.
 */

///Breaking of OCP
class PaymentManager {
    private func makeCashPayment(amount: Double) {
        
    }
    
    private func makeVisaPayment(amount: Double) {
        
    }
}

// When we need to update PaymentManager and need to add new feature then its break OCP.
class _PaymentManager {
    private func makeCashPayment(amount: Double) {
        
    }
    
    private func makeVisaPayment(amount: Double) {
        
    }
    
    // added new feature
    private func makeMasterPayment(amount: Double) {
        
    }
}

//****************************************** OCP Example ***********************************
protocol Paymentable {
    func makePayment(amount: Double)
}

class PaymentManager_OCP {
    func makePayment(amount: Double, payment: Paymentable) {
        payment.makePayment(amount: amount)
    }
}

class CashPayment: Paymentable {
    func makePayment(amount: Double) {
    }
}

class VisaPayment: Paymentable {
    func makePayment(amount: Double) {
        
    }
}

class MasterPayment: Paymentable {
    func makePayment(amount: Double) {
        
    }
}
