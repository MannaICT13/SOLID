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
    var employees: [Employee]
    
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

//****************************************** DIP Example ***********************************

protocol Storage {
    func save(string: String)
}

class FileSystemManager: Storage {
    func save(string: String) {
        // Open a file in read-mode
        // Save the string in this file
        // Close the file
    }
}
class DatabaseManager: Storage {
    func save(string: String) {
        // Connect to the database
        // Execute the query to save the string in a table
        // Close the connection
    }
}

class _Handler {
    let storage: Storage
    // Storage types
    init(storage: Storage) {
        self.storage = storage
    }
    
    func handle(string: String) {
        storage.save(string: string)
    }
}
