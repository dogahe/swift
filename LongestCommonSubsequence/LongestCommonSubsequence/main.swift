//
//  main.swift
//  LongestCommonSubsequence
//
//  Created by Behzad Dogahe on 5/4/21.
//

/*
 1143. Longest Common Subsequence
 
 Given two strings text1 and text2, return the length of their longest common subsequence. If there is no common subsequence, return 0.

 A subsequence of a string is a new string generated from the original string with some characters (can be none) deleted without changing the relative order of the remaining characters.

 For example, "ace" is a subsequence of "abcde".
 A common subsequence of two strings is a subsequence that is common to both strings.

  

 Example 1:

 Input: text1 = "abcde", text2 = "ace"
 Output: 3
 Explanation: The longest common subsequence is "ace" and its length is 3.
 Example 2:

 Input: text1 = "abc", text2 = "abc"
 Output: 3
 Explanation: The longest common subsequence is "abc" and its length is 3.
 Example 3:

 Input: text1 = "abc", text2 = "def"
 Output: 0
 Explanation: There is no such common subsequence, so the result is 0.
  

 Constraints:

 1 <= text1.length, text2.length <= 1000
 text1 and text2 consist of only lowercase English characters.
 */

// SLOW
/*
func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    if text1.count == 0 || text2.count == 0 {
        return 0
    }
    if text1.suffix(1) == text2.suffix(1) {
        return 1 + longestCommonSubsequence(String(text1.prefix(text1.count - 1)), String(text2.prefix(text2.count - 1)))
        
    } else {
        let o1 = longestCommonSubsequence(text1, String(text2.prefix(text2.count - 1)))
        let o2 = longestCommonSubsequence(String(text1.prefix(text1.count - 1)), text2)
        return max(o1, o2)
    }
}
*/

func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    let m = text1.count
    let n = text2.count
    var l: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
    for i in 0 ... m {
        for j in 0 ...  n {
            if i == 0 || j == 0 {
                l[i][j] = 0
            } else if text1[text1.index(text1.startIndex, offsetBy: i - 1)] == text2[text2.index(text2.startIndex, offsetBy: j - 1)] {
                l[i][j] = 1 + l[i - 1][j - 1]
            } else {
                l[i][j] = max(l[i - 1][j], l[i][j - 1])
            }
        }
    }
    return l[m][n]
}

print(longestCommonSubsequence("ABCDGH", "AEDFHR"))
print(longestCommonSubsequence("AGGTAB", "GXTXAYB"))
print(longestCommonSubsequence("ylqpejqbalahwr", "yrkzavgdmdgtqpg"))
