/*

 Consecutive Characters

 Given a string s, the power of the string is the maximum length of a non-empty substring that contains only one unique character.

 Return the power of the string.

 Example 1:

 Input: s = "leetcode"
 Output: 2
 Explanation: The substring "ee" is of length 2 with the character 'e' only.
 Example 2:

 Input: s = "abbcccddddeeeeedcba"
 Output: 5
 Explanation: The substring "eeeee" is of length 5 with the character 'e' only.
 Example 3:

 Input: s = "triplepillooooow"
 Output: 5
 Example 4:

 Input: s = "hooraaaaaaaaaaay"
 Output: 11
 Example 5:

 Input: s = "tourist"
 Output: 1
  
 Constraints:

 1 <= s.length <= 500
 s contains only lowercase English letters.
 
 */

import Foundation

func maxPower(_ s: String) -> Int {
    if s.count < 2 {
        return s.count
    }
    var maxCount: Int = 0
    var lastChar = s[s.startIndex]
    var count: Int = 1
    for i in 1 ..< s.count {
        let curr = s[s.index(s.startIndex, offsetBy: i)]
        if curr == lastChar {
            count += 1
        } else {
            lastChar = curr
            maxCount = max(maxCount, count)
            count = 1
        }
    }
    maxCount = max(maxCount, count)
    return maxCount
}

let s = "aa"
print(maxPower(s))
