/*
 Basic Calculator II
 
 Given a string s which represents an expression, evaluate this expression and return its value.

 The integer division should truncate toward zero.

  

 Example 1:

 Input: s = "3+2*2"
 Output: 7
 Example 2:

 Input: s = " 3/2 "
 Output: 1
 Example 3:

 Input: s = " 3+5 / 2 "
 Output: 5
  

 Constraints:

 1 <= s.length <= 3 * 105
 s consists of integers and operators ('+', '-', '*', '/') separated by some number of spaces.
 s represents a valid expression.
 All the integers in the expression are non-negative integers in the range [0, 231 - 1].
 The answer is guaranteed to fit in a 32-bit integer.
 */

import Foundation

func calculate(_ s: String) -> Int {
    let ex = String(s.filter { !" ".contains($0) })
    var operands: [Int] = []
    var operation: Character = "+"
    var num: Int = 0
    var i: Int = 0
    while i < ex.count {
        let c = ex[ex.index(ex.startIndex, offsetBy: i)]
        if c.isNumber {
            num = num * 10 + Int(String(c))!
        }
        if !c.isNumber || i == ex.count - 1 {
            if operation == "-" {
                operands.append(-num)
            } else if operation == "+" {
                operands.append(num)
            } else if operation == "*" {
                operands.append(operands.popLast()! * num)
            } else if operation == "/" {
                operands.append(operands.popLast()! / num)
            }
            operation = c
            num = 0
        }
        i += 1
    }
    var sum: Int = 0
    while operands.count > 0 {
        sum += operands.popLast()!
    }
    return sum
}

//let s = "1*2-3/4+5*6-7*8+9/10"
let s = "3+2*2"
calculate(s)
