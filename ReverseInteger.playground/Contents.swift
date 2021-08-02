/*
 
 tags:Google
 
 7. Reverse Integer
 
 Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

 Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

 Example 1:

 Input: x = 123
 Output: 321
 Example 2:

 Input: x = -123
 Output: -321
 Example 3:

 Input: x = 120
 Output: 21
 Example 4:

 Input: x = 0
 Output: 0
  
 Constraints:

 -231 <= x <= 231 - 1

 */

import Foundation

func reverse(_ x: Int32) -> Int32 {
    var sign: Int32 = -1
    if x > 0 {
        sign = 1
    }
    var y = abs(x)
    var sum: Int32 = 0
    while y > 0 {
        let rem = y % 10
        y = y / 10
        if sign > 0 {
            if sum > Int32.max/10 || (sum == Int32.max/10 && rem > 7) {
                return 0
            }
        } else {
            if sum > Int32.min/10 || (sum == Int32.max/10 && rem > 8) {
                return 0
            }
             
        }
        sum = sum * 10 + rem
    }
    return sum * sign
}

let x: Int32 = 153
reverse(x)
reverse(1534236469)

Int32.max
Int32.min

