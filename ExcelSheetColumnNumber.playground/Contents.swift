/*
 Excel Sheet Column Number
 
 Given a column title as appear in an Excel sheet, return its corresponding column number.
 
 For example:
 
 A -> 1
 B -> 2
 C -> 3
 ...
 Z -> 26
 AA -> 27
 AB -> 28
 ...
 
 Input: "A"
 Output: 1
 
 Input: "AB"
 Output: 28
 
 Input: "ZY"
 Output: 701
 
 Constraints:

 1 <= s.length <= 7
 s consists only of uppercase English letters.
 s is between "A" and "FXSHRXW".
 
 */

import Foundation

func titleToNumber(_ s: String) -> Int {
    let length = s.count
    var sum: Int = 0
    for i in 0..<length {
        let index = s.index(s.startIndex, offsetBy: i)
        let char = s[index]
        let A: Character = "A"
        if let charVal = char.asciiValue, let aVal = A.asciiValue {
            let number = charVal - aVal + 1
            sum += Int(number) * Int(truncating: pow(26.0, length - i - 1) as NSNumber)
        }
    }
    return sum
}

let str = "ZY"
titleToNumber(str)


