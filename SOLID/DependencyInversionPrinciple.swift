//
//  DependencyInversionPrinciple.swift
//  SOLID
//
//  Created by Md Khaled Hasan Manna on 30/12/22.
//

import Foundation

/*
 Dependency Inversion Principle:
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

/************** Another Example ***************/

// BAD Example 
// Low-level class: Dog
class Dog {
    func bark() {
        print("Woof!")
    }
}

// Low-level class: Cat
class Cat {
    func meow() {
        print("Meow!")
    }
}

// High-level class: AnimalSoundMaker
class AnimalSoundMaker {
    let dog: Dog
    let cat: Cat
    
    init(dog: Dog, cat: Cat) {
        self.dog = dog
        self.cat = cat
    }
    
    func makeDogSound() {
        dog.bark()
    }
    
    func makeCatSound() {
        cat.meow()
    }
}

/***************************Good Example*********************/
// Abstraction: Animal
protocol Animal {
    func makeSound()
}

// Low-level class: Dog
class Dog: Animal {
    func makeSound() {
        print("Woof!")
    }
}

// Low-level class: Cat
class Cat: Animal {
    func makeSound() {
        print("Meow!")
    }
}

// High-level class: AnimalSoundMaker
class AnimalSoundMaker {
    let animal: Animal
    
    init(animal: Animal) {
        self.animal = animal
    }
    
    func performSound() {
        animal.makeSound()
    }
}
