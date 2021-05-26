/*
 
 67. Add Binary
 
 Given two binary strings a and b, return their sum as a binary string.

 Example 1:

 Input: a = "11", b = "1"
 Output: "100"
 Example 2:

 Input: a = "1010", b = "1011"
 Output: "10101"
  
 Constraints:

 1 <= a.length, b.length <= 104
 a and b consist only of '0' or '1' characters.
 Each string does not contain leading zeros except for the zero itself.
 
 */
func addBinary(_ a: String, _ b: String) -> String {
    var carry = 0
    var output: String = ""
    for i in 0 ..< max(a.count, b.count) {
        var aa: Character?
        var bb: Character?
        if i <= a.count - 1 {
            aa = a[a.index(a.startIndex, offsetBy: a.count - 1 - i)]
        }
        if i <= b.count - 1 {
            bb = b[b.index(b.startIndex, offsetBy: b.count - 1 - i)]
        }
        var aNum = 0
        var bNum = 0
        
        if let aa = aa {
            if aa == "1" {
                aNum = 1
            }
        }
        if let bb = bb {
            if bb == "1" {
                bNum = 1
            }
        }
        
        var sum = aNum + bNum + carry
        carry = sum / 2
        sum = sum % 2
        output = "\(sum)\(output)"
    }
    if carry > 0 {
        output = "\(carry)\(output)"
    }
    return output
}
let a = "1010", b = "1011"

addBinary(a, b)
