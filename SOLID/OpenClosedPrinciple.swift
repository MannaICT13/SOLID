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
