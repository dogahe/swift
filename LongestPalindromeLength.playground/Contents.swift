/*
Longest Palindrome

Given a string s which consists of lowercase or uppercase letters, return the length of the longest palindrome that can be built with those letters.

Letters are case sensitive, for example, "Aa" is not considered a palindrome here.

Example 1:
 
Input: s = "abccccdd"
Output: 7
Explanation:
One longest palindrome that can be built is "dccaccd", whose length is 7.
  
Example 2:
 
Input: s = "a"
Output: 1
 
Example 3:
 
Input: s = "bb"
Output: 2

Constraints:

1 <= s.length <= 2000
s consits of lower-case and/or upper-case English letters only.

 */
import Foundation


func longestPalindrome(_ s: String) -> Int {
    var letters: [Character: Int] = [:]
    for index in 0..<s.count {
        let letter = s[s.index(s.startIndex, offsetBy: index)]
        if letters[letter] != nil {
            letters[letter] = letters[letter]! + 1
        } else {
            letters[letter] = 1
        }
    }
    
    var sum: Int = 0
    letters.forEach { (key, value) in
        sum += value/2
    }
    let result = min(sum * 2 + 1, s.count)
    return result
}

let str = "bb"
longestPalindrome(str)



