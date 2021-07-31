/*
 
 tags:Google
 
 43. Multiply Strings
 
 Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.

 Note: You must not use any built-in BigInteger library or convert the inputs to integer directly.

 Example 1:
 Input: num1 = "2", num2 = "3"
 Output: "6"
 
 Example 2:
 Input: num1 = "123", num2 = "456"
 Output: "56088"
  
 Constraints:

 1 <= num1.length, num2.length <= 200
 num1 and num2 consist of digits only.
 Both num1 and num2 do not contain any leading zero, except the number 0 itself.
 
 */


import Foundation

func multiply(_ num1: String, _ num2: String) -> String {
    var elements: [String] = []
    var maxLength = 0
    for i in 0 ..< num2.count {
        let n2 = num2[num2.index(num2.startIndex, offsetBy: num2.count - 1 - i)]
        var carry: Int = 0
        let zeros = String(repeating: "0", count: i)
        var element: String = zeros
        for j in 0 ..< num1.count {
            let n1 = num1[num1.index(num1.startIndex, offsetBy: num1.count - 1 - j)]
            if let i1 = n1.wholeNumberValue, let i2 = n2.wholeNumberValue {
                var mul = i1 * i2 + carry
                carry = mul / 10
                mul = mul % 10
                element = "\(mul)\(element)"
            }
        }
        if carry > 0 {
            element = "\(carry)\(element)"
        }
        maxLength = max(maxLength, element.count)
        elements.append(element)
    }
    var result = ""
    var carry = 0
    for i in 0 ..< maxLength {
        var sum = carry
        for element in elements {
            if element.count - 1 - i >= 0 {
                let n = element[element.index(element.startIndex, offsetBy: element.count - 1 - i)]
                if let num = n.wholeNumberValue {
                    sum += num
                }
            }
        }
        carry = sum / 10
        sum = sum % 10
        result = "\(sum)\(result)"
    }
    if carry > 0 {
        result = "\(carry)\(result)"
    }
    while result.count > 1 && result.first == "0" {
        result = String(result.dropFirst())
    }
    return result
}

let num2 = "123"
let num1 = "0"

multiply(num1, num2)
