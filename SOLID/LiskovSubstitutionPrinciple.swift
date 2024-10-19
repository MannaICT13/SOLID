//
//  LiskovSubstitutionPrinciple.swift
//  SOLID
//
//  Created by Md Khaled Hasan Manna on 30/12/22.
//

import Foundation

/*
 Liskov Substitution Principle:
 (Inheritance issue)
 -Functions that use pointers or references to base classes must be able to use objects of derived classes without knowing it.
 -Objects should be replaced with instances of their subclasses without altering the behavior
 -*****Liskov Substitution Principle (LTSY) states that when we inherit from a base class, the subclass should not modify the behavior of the base class functions
 */

//Breaaking of LSP

class Rectangle {
    var length: Double = .zero
    var width: Double = .zero
    
    func area() -> Double {
        return length * width
    }
}

class Square: Rectangle {
    override var width: Double {
        didSet {
            length = width
        }
    }
}

func printArea(of rectangle: Rectangle) {
    rectangle.width = 2
    rectangle.length = 5
    
    print(rectangle.area())
}

let rectangle = Rectangle()
//printArea(of: rectangle) 10

let square = Square()
//printArea(of: square) 4

//****************************************** LSP Example ***********************************

protocol Polygon {
    var area: Double { get }
}

class _Rectangle: Polygon {
    private let length: Double
    private let width: Double
    
    init(length: Double, width: Double) {
        self.length = length
        self.width = width
    }
    
    var area: Double {
        return length * width
    }
}

class _Square: Polygon {
    private let length: Double
    
    init(length: Double) {
        self.length = length
    }
    
    var area: Double {
        return length * length
    }
}

func printArea(of polygon: Polygon) {
    print(polygon.area)
}

let _rectangle = _Rectangle(length: 2, width: 5)
//printArea(of: rectangle) 10

let _square = _Square(length: 2)
//printArea(of: square) 4

//*****

/*********************************Here is the another LSP example:*************************************************/
// BAD Example 

class Operators {
    func add(num1: Int, num2: Int) -> Int{
        return num1 + num2
    }
    
    func sub(num1: Int, num2: Int) -> Int{
        return num1 - num2
    }
}

class Calculator: Operators {
    override func add(num1: Int, num2: Int) -> Int {
        return num1 * num2
    }
    
    override func sub(num1: Int, num2: Int) -> Int {
        return num1 + num2
    }
}

let add = Operators()
print(add.add(num1: 5, num2: 5)) // cool works -> 10

let calc = Calculator()
print(calc.add(num1: 5, num2: 5)) // not working... why? The user is angry. -> 25


// GOOD Example
class Operators {
    func add(num1: Int, num2: Int) -> Int{
        return num1 + num2
    }
    
    func sub(num1: Int, num2: Int) -> Int{
        return num1 - num2
    }
}

class Calculator: Operators {
    override func add(num1: Int, num2: Int) -> Int {
        return num1 + num2
    }
    
    override func sub(num1: Int, num2: Int) -> Int {
        return num1 - num2
    }
    
    func add(num1: Int, num2: Int, num3: Int) -> Int{
        return num1 + num2 + num3
    }
}

let add = Operators()
print(add.add(num1: 5, num2: 5)) // cool works -> 10

let calc = Calculator()
print(calc.add(num1: 5, num2: 5)) // cool works -> 10

// also added a new function

print(calc.add(num1: 2, num2: 5, num3: 6))
