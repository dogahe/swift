/*
 65. Valid Number

 A valid number can be split up into these components (in order):

 A decimal number or an integer.
 (Optional) An 'e' or 'E', followed by an integer.
 A decimal number can be split up into these components (in order):

 (Optional) A sign character (either '+' or '-').
 One of the following formats:
 One or more digits, followed by a dot '.'.
 One or more digits, followed by a dot '.', followed by one or more digits.
 A dot '.', followed by one or more digits.
 An integer can be split up into these components (in order):

 (Optional) A sign character (either '+' or '-').
 One or more digits.
 For example, all the following are valid numbers: ["2", "0089", "-0.1", "+3.14", "4.", "-.9", "2e10", "-90E3", "3e+7", "+6e-1", "53.5e93", "-123.456e789"], while the following are not valid numbers: ["abc", "1a", "1e", "e3", "99e2.5", "--6", "-+3", "95a54e53"].

 Given a string s, return true if s is a valid number.

 Example 1:

 Input: s = "0"
 Output: true
 Example 2:

 Input: s = "e"
 Output: false
 Example 3:

 Input: s = "."
 Output: false
 Example 4:

 Input: s = ".1"
 Output: true

 Constraints:

 1 <= s.length <= 20
 s consists of only English letters (both uppercase and lowercase), digits (0-9), plus '+', minus '-', or dot '.'.
 
 */

func isNumber(_ s: String) -> Bool {
    let str = s.lowercased()
    for i in 0 ..< str.count {
        let c = str[str.index(str.startIndex, offsetBy: i)]
        if c.isLetter {
            if c != "e" {
                return false
            }
        }
    }
    
    if let eIndex = str.firstIndex(of: "e") {
        var temp = str
        temp.remove(at: eIndex)
        // if there are multiple e's it's not a valid number
        if temp.firstIndex(of: "e") != nil {
            return false
        }
        let parts = str.split(separator: "e")
        if parts.count < 2 {
            return false
        }
        let leftPart = parts[0]
        let rightPart = parts[1]
        return (isValidDecimal(String(leftPart)) || isValidInteger(String(leftPart))) && isValidInteger(String(rightPart))
    }
    return isValidInteger(str) || isValidDecimal(str)
}

func isValidDecimal(_ str: String) -> Bool {
    var newStr = str
    if str.prefix(1) == "+" || str.prefix(1) == "-" {
        newStr = String(str.suffix(str.count - 1))
    }
    if let dotIndex = newStr.firstIndex(of: ".") {
        if newStr.count == 1 {
            return false
        }
        var temp = newStr
        temp.remove(at: dotIndex)
        // if there are multiple .'s it's not a valid number
        if temp.firstIndex(of: ".") != nil {
            return false
        }
        
        let parts = newStr.split(separator: ".")
        for part in parts {
            if !isValidDigits(String(part)) {
               return false
            }
        }
        return true
    } else {
        return false
    }
}

func isValidInteger(_ str: String) -> Bool {
    var newStr = str
    if str.prefix(1) == "+" || str.prefix(1) == "-" {
        newStr = String(str.suffix(str.count - 1))
    }
    return isValidDigits(newStr)
}

func isValidDigits(_ str: String) -> Bool {
    if str.isEmpty {
        return false
    }
    for i in 0 ..< str.count {
        let c = str[str.index(str.startIndex, offsetBy: i)]
        if !c.isNumber {
            return false
        }
    }
    return true
}

let input2 = ["abc", "1a", "1e", "e3", "99e2.5", "--6", "-+3", "95a54e53"]
let inputs2 = ["2", "0089", "-0.1", "+3.14", "4.", "-.9", "2e10", "-90E3", "3e+7", "+6e-1", "53.5e93", "-123.456e789"]
for i in 0 ..< inputs2.count {
    print(isNumber(inputs2[i]))
}
