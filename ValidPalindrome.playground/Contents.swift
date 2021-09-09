/*
 
 tags:Facebook
 
 125. Valid Palindrome
 
 Given a string s, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

 Example 1:
 Input: s = "A man, a plan, a canal: Panama"
 Output: true
 Explanation: "amanaplanacanalpanama" is a palindrome.
 
 Example 2:
 Input: s = "race a car"
 Output: false
 Explanation: "raceacar" is not a palindrome.
  
 Constraints:
 1 <= s.length <= 2 * 105
 s consists only of printable ASCII characters.
 
 */

var s = "A man, a plan, a canal: Panama"

func isPalindrome(_ s: String) -> Bool {
    var i: Int = 0
    var j: Int = 1
    var isPalindrome: Bool = true
    let sArr: [Character] = Array(s)
    while i + j <= s.count {
        let left = sArr[i]
        let right = sArr[s.count - j]
        if !(left.isLetter || left.isNumber) {
            i += 1
            continue
        }
        if !(right.isLetter || right.isNumber) {
            j += 1
            continue
        }
        if left.lowercased() != right.lowercased() {
            isPalindrome = false
            break
        }
        i += 1
        j += 1
    }
    return isPalindrome
}

isPalindrome(s)
