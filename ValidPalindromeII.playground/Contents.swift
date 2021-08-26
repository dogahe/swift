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
    let sArr: [Character] = Array(s)
    var i: Int = 0
    var j: Int = s.count - 1
    while i < j {
        let left = sArr[i]
        let right = sArr[j]
        if left != right {
            return isPalindrome(sArr, i + 1, j) || isPalindrome(sArr, i, j - 1)
        }
        i += 1
        j -= 1
    }
    return true
}

func isPalindrome(_ s: [Character], _ left: Int, _ right: Int) -> Bool {
    var i = left
    var j = right
    while i < j {
        let left = s[i]
        let right = s[j]
        if left != right {
            return false
        }
        i += 1
        j -= 1
    }
    return true
}

let s = "aba"
validPalindrome(s)

let s2 = "abca"
validPalindrome(s2)

let s3 = "abc"
validPalindrome(s3)
