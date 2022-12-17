//
//  SingleResponsibilityPrinciple.swift
//  SOLID
//
//  Created by Md Khaled Hasan Manna on 17/12/22.
//

import Foundation

/*
 Single Responsibility Priciple:
 Every module should have only one responsibility and reason to change.
 */

/// Breaking of SRP Example:
class Handler {
    private func handle() {
        let data = requestDataToAPI()
        let array = parseResponse(data: data)
        saveToDB(array: array)
    }
    
    private func requestDataToAPI() -> Data {
        // Network Request code here
        return Data()
    }
    
    private func parseResponse(data: Data) -> [String] {
        // Network  response code here
        return []
    }
    
    private func saveToDB(array: [String]) {
        // Save data code here
    }
}


