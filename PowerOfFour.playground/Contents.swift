// Given an integer (signed 32 bits), write a function to check whether it is a power of 4.
// Input: 16
// Output: true
// Input: 5
// Output: false

import Foundation

func isPowerOfFour(_ num: Int) -> Bool {
    if num < 0 { return false }
    let root = sqrt(sqrt(Double(num)))
    return root == Double(Int(root))
}
isPowerOfFour(-81)


