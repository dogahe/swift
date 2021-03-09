/*
 18.1 Write a function that adds two numbers. You should not use + or any arithmetic operators.
 */
import Foundation

func add(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    }
    let sum = a ^ b // XOR
    let carry = (a & b) << 1 
    return add(sum, carry)
}

let a = 19
let b = 85
add(a, b)

