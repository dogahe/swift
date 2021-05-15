/*
 415. Add Strings
 
 Given two non-negative integers, num1 and num2 represented as string, return the sum of num1 and num2 as a string.

 You must solve the problem without using any built-in library for handling large integers (such as BigInteger). You must also not convert the inputs to integers directly.

  

 Example 1:

 Input: num1 = "11", num2 = "123"
 Output: "134"
 Example 2:

 Input: num1 = "456", num2 = "77"
 Output: "533"
 Example 3:

 Input: num1 = "0", num2 = "0"
 Output: "0"
  

 Constraints:

 1 <= num1.length, num2.length <= 104
 num1 and num2 consist of only digits.
 num1 and num2 don't have any leading zeros except for the zero itself.
 */
func addStrings(_ num1: String, _ num2: String) -> String {
    let len = max(num1.count, num2.count)
    var carry = 0
    var output: String = ""
    for i in 0 ..< len {
        var d1 = 0
        if i < num1.count {
            let c = num1[num1.index(num1.startIndex, offsetBy: num1.count - 1 - i)]
            if let d = Int(String(c)) {
                d1 = d
            }
        }
        var d2 = 0
        if i < num2.count {
            let c = num2[num2.index(num2.startIndex, offsetBy: num2.count - 1 - i)]
            if let d = Int(String(c)) {
                d2 = d
            }
        }
        var sum = d1 + d2 + carry
        carry = sum / 10
        sum = sum % 10
        output.insert(contentsOf: "\(sum)", at: output.startIndex)
    }
    if carry > 0 {
        output.insert(contentsOf: "\(carry)", at: output.startIndex)
    }
    return output
}

let num1 = "0"
let num2 = "0"

addStrings(num1, num2)
