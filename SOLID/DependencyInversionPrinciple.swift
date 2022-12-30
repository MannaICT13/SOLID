//
//  DependencyInversionPrinciple.swift
//  SOLID
//
//  Created by Md Khaled Hasan Manna on 30/12/22.
//

import Foundation

/*
 Dependenccy Inversion Principle:
 High-level modules should not depend on low-level modules both should depend on Abstractions.
 */

class Employee {
    func work() {
        print("Working....")
    }
}

class Employer {
    var employees: [Employee] // breaking the DIP
    
    init(employees: [Employee]) {
        self.employees = employees
    }
    
    func manage() {
        employees.forEach { employee in
            employee.work()
        }
    }
}

let instance = Employer(employees: [Employee]())
//instance.manage()
