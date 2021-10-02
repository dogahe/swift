/*
 
 tags:Facebook
 
 166. Fraction to Recurring Decimal
 
 Given two integers representing the numerator and denominator of a fraction, return the fraction in string format.

 If the fractional part is repeating, enclose the repeating part in parentheses.

 If multiple answers are possible, return any of them.

 It is guaranteed that the length of the answer string is less than 104 for all the given inputs.

 Example 1:
 Input: numerator = 1, denominator = 2
 Output: "0.5"
 
 Example 2:
 Input: numerator = 2, denominator = 1
 Output: "2"
 
 Example 3:
 Input: numerator = 2, denominator = 3
 Output: "0.(6)"
 
 Example 4:
 Input: numerator = 4, denominator = 333
 Output: "0.(012)"
 
 Example 5:
 Input: numerator = 1, denominator = 5
 Output: "0.2"
  
 Constraints:

 -231 <= numerator, denominator <= 231 - 1
 denominator != 0
 */

import Foundation

func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
    var n = numerator
    if numerator < 0 {
        n = abs(numerator)
    }
    var result: String = ""
    var lastResult: String = ""
    var dict: [Int: String] = [:]
    while n > 0 {
        while n < denominator {
            n *= 10
            if result.isEmpty {
                result += "0."
            } else {
                result += "0"
            }
        }
        if let prev = dict[n] {
            
        } else {
            let d = n / denominator
            result += "\(d)"
            let r = n % denominator
            if r > 0 {
                n = r
                n *= 10
            }
        }
    }
    return result
}
