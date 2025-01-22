import UIKit

// MARK: TODO
/*
 Implement a calculator. The calculator can perform Addition, Subtraction, Multiplication and Division on 2 Integers and returns an Integer. In the logic you can only use the '+' plus operator and a constant with value of -1, 0, 1. Division will return only the smallest whole number (e.g. 14/5 = 2) Hint: create a FlipSign method that will return the negative of a number (e.g. FlipSign(4) returns -4)
 */

// Function to flip the sign of a number
func flipSign(_ number: Int) -> Int {
    var flipped = 0
    let delta = number > 0 ? -1 : 1
    var counter = abs(number)
    while counter > 0 {
        flipped += delta
        counter += delta
    }
    return flipped
}

// Function to add two numbers
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

// Function to subtract two numbers using addition and flipSign
func subtract(_ a: Int, _ b: Int) -> Int {
    return add(a, flipSign(b))
}

// Function to multiply two numbers
func multiply(_ a: Int, _ b: Int) -> Int {
    var result = 0
    let absB = abs(b)
    for _ in 0..<absB {
        result = add(result, a)
    }
    if b < 0 {
        result = flipSign(result)
    }
    return result
}

// Function to divide two numbers, returning the smallest whole number
func divide(_ a: Int, _ b: Int) -> Int {
    guard b != 0 else {
        fatalError("Division by zero is undefined")
    }
    
    let absA = abs(a)
    let absB = abs(b)
    var result = 0
    var sum = 0
    
    while add(sum, absB) <= absA {
        sum = add(sum, absB)
        result = add(result, 1)
    }
    
    if (a < 0 && b > 0) || (a > 0 && b < 0) {
        result = flipSign(result)
    }
    
    return result
}

// Example usage
let a = 14
let b = 5
print("Addition: \(add(a, b))")          // 19
print("Subtraction: \(subtract(a, b))") // 9
print("Multiplication: \(multiply(a, b))") // 70
print("Division: \(divide(a, b))")      // 2
