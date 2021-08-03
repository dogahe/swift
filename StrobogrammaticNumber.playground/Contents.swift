/*
 
 tags:Google
 
 246. Strobogrammatic Number
 
 Given a string num which represents an integer, return true if num is a strobogrammatic number.

 A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down).
 
 Example 1:

 Input: num = "69"
 Output: true
 Example 2:

 Input: num = "88"
 Output: true
 Example 3:

 Input: num = "962"
 Output: false
 Example 4:

 Input: num = "1"
 Output: true
  
 Constraints:

 1 <= num.length <= 50
 num consists of only digits.
 num does not contain any leading zeros except for zero itself.
 
 */

func isStrobogrammatic(_ num: String) -> Bool {
    let numArr: [Character] = Array(num)
    var upside: String = ""
    for i in 0 ..< num.count {
        var c = numArr[i]
        if c != "0" && c != "1" && c != "6" && c != "8" && c != "9" {
            return false
        }
        if c == "9" {
            c = "6"
        } else if c == "6" {
            c = "9"
        }
        upside = "\(c)\(upside)"
    }
    return num == upside
}

isStrobogrammatic("69")
isStrobogrammatic("88")
isStrobogrammatic("962")
isStrobogrammatic("968018661806000118986811000908199810896")
