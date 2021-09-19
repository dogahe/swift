/*
 
 tags:Google
 tags:Facebook
 
 5. Longest Palindromic Substring
 
 Given a string s, return the longest palindromic substring in s.

 Example 1:
 Input: s = "babad"
 Output: "bab"
 Note: "aba" is also a valid answer.
 
 Example 2:
 Input: s = "cbbd"
 Output: "bb"
 
 Example 3:
 Input: s = "a"
 Output: "a"
 
 Example 4:
 Input: s = "ac"
 Output: "a"
  
 Constraints:

 1 <= s.length <= 1000
 s consist of only digits and English letters.

 */

import Foundation

func longestPalindrome(_ s: String) -> String {
    let sArr: [Character] = Array(s)
    var table: [[Bool]] = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
    var maxLength = 1
    for i in 0 ..< s.count {
        table[i][i] = true
    }
    var start = 0
    if s.count > 1 {
        for i in 0 ..< s.count - 1 {
            if sArr[i] == sArr[i + 1]  {
                table[i][i + 1] = true
                start = i
                maxLength = 2
            }
        }
    }
    if s.count > 2 {
        for length in 3 ... s.count {
            for i in 0 ..< s.count - length + 1 {
                let j = i + length - 1
                if table[i + 1][j - 1] && sArr[i] == sArr[j] {
                    table[i][j] = true
                    if (length > maxLength) {
                        start = i
                        maxLength = length
                    }
                }
            }
        }
    }
    return String(s[s.index(s.startIndex, offsetBy: start) ... s.index(s.startIndex, offsetBy: start + maxLength - 1)])
}

//let s = "forgeeksskeegfor"//"ccc"//"forgeeksskeegfor"//"babad"

let s = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"

longestPalindrome(s)
