//
//  InterfaceSegregationprinciple.swift
//  SOLID
//
//  Created by Md Khaled Hasan Manna on 30/12/22.
//

import Foundation

/*
 Interface Segregation Principle:
 Clients should not be forced to depend upon interfaces that they do not use.
 */

//Breaing of ISP

protocol Worker {
    func work()
    func eat()
}

class Human: Worker {
    func work() {
        print("Working")
    }
    func eat() {
        print("Eating")
    }
}

class Robot: Worker {
    func work() {
        print("Working")
    }
    
    // Breaking of ISP
    func eat() {
        //Robot can't eat
    }
}
