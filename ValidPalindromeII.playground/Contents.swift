/*

 680. Valid Palindrome II
 
 Given a string s, return true if the s can be palindrome after deleting at most one character from it.

 Example 1:

 Input: s = "aba"
 Output: true
 Example 2:

 Input: s = "abca"
 Output: true
 Explanation: You could delete the character 'c'.
 Example 3:

 Input: s = "abc"
 Output: false
  
 Constraints:

 1 <= s.length <= 105
 s consists of lowercase English letters.
 
 */

func validPalindrome(_ s: String) -> Bool {
    var i: Int = 0
    var j: Int = s.count - 1
    while i < j {
        let leftIndex = s.index(s.startIndex, offsetBy: i)
        let rightIndex = s.index(s.startIndex, offsetBy: j)
        let left = s[leftIndex]
        let right = s[rightIndex]
        if left != right {
            return isPalindrome(s, i + 1, j) || isPalindrome(s, i, j - 1)
        }
        i += 1
        j -= 1
    }
    return true
}

func isPalindrome(_ s: String, _ left: Int, _ right: Int) -> Bool {
    var i = left
    var j = right
    while i < j {
        let leftIndex = s.index(s.startIndex, offsetBy: i)
        let rightIndex = s.index(s.startIndex, offsetBy: j)
        let left = s[leftIndex]
        let right = s[rightIndex]
        if left != right {
            return false
        }
        i += 1
        j -= 1
    }
    return true
}

let s = "abc"

validPalindrome(s)
