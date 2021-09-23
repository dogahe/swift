/*
 
 tags:Facebook
 
 266. Palindrome Permutation
 
 Given a string s, return true if a permutation of the string could form a palindrome.

 Example 1:
 Input: s = "code"
 Output: false
 
 Example 2:
 Input: s = "aab"
 Output: true
 
 Example 3:
 Input: s = "carerac"
 Output: true

 Constraints:
 1 <= s.length <= 5000
 s consists of only lowercase English letters.
 
 */

func canPermutePalindrome(_ s: String) -> Bool {
    var dict: [Character: Int] = [:]
    for c in s {
        if let val = dict[c] {
            dict[c] = val + 1
        } else {
            dict[c] = 1
        }
    }
    
    var oddCount = 0
    for (k, v) in dict {
        if v % 2 == 1 {
            oddCount += 1
        }
    }
    if oddCount > 1 {
        return false
    }
    return true
}

let s = "code"
canPermutePalindrome(s)
    
let s2 = "aab"
canPermutePalindrome(s2)

let s3 = "carerac"
canPermutePalindrome(s3)
