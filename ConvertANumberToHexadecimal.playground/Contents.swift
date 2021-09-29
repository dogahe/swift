/*
 
 tags:Facebook
 
 405. Convert a Number to Hexadecimal
 
 Given an integer num, return a string representing its hexadecimal representation. For negative integers, two’s complement method is used.

 All the letters in the answer string should be lowercase characters, and there should not be any leading zeros in the answer except for the zero itself.

 Note: You are not allowed to use any built-in library method to directly solve this problem.

 Example 1:
 Input: num = 26
 Output: "1a"
 
 Example 2:
 Input: num = -1
 Output: "ffffffff"
  
 Constraints:

 -231 <= num <= 231 - 1
 */


import Foundation

func toHex(_ num: Int) -> String {
    if num == 0 {
        return "0"
    }
    let arr: [Character] = ["a", "b", "c", "d", "e", "f"]
    var n = num
    if num < 0 {
        n = Int(pow(2.0, 32.0)) - abs(num)
    }
    var output: [Character] = []
    while n > 0 {
        let d = n / 16
        let r = n % 16
        if r > 9 {
            output.append(arr[r - 10])
        } else {
            output.append(Character("\(r)"))
        }
        n = d
    }
    output = output.reversed()
    return String(output)
}

let num = 26
toHex(num)

let num2 = -1
toHex(num2)
