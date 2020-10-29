/*
 Remove Duplicate Letters
 Given a string s, remove duplicate letters so that every letter appears once and only once. You must make sure your result is the smallest in lexicographical order among all possible results.

 Note: This question is the same as 1081: https://leetcode.com/problems/smallest-subsequence-of-distinct-characters/

  

 Example 1:

 Input: s = "bcabc"
 Output: "abc"
 Example 2:

 Input: s = "cbacdcbc"
 Output: "acdb"
  

 Constraints:

 1 <= s.length <= 10^4
 s consists of lowercase English letters.
 
*/

// https://github.com/cherryljr/LeetCode/blob/master/Smallest%20Subsequence%20of%20Distinct%20Characters/Smallest%20Subsequence%20of%20Distinct%20Characters.java

import Foundation

func removeDuplicateLetters(_ s: String) -> String {
    var lastIndex: [Int] = Array(repeating: -1, count: 26)
    for index in 0..<s.count {
        let letter = s[s.index(s.startIndex, offsetBy: index)]
        lastIndex[Int(letter.asciiValue! - Character("a").asciiValue!)] = index
    }
    var used: [Bool] = Array(repeating: false, count: 26)
    var result: String = ""
    for index in 0 ..< s.count {
        let letter = s[s.index(s.startIndex, offsetBy: index)]
        if used[Int(letter.asciiValue! - Character("a").asciiValue!)] {
            continue
        }
        while result.count > 0 && (result.last ?? Character("-")) > letter && lastIndex[Int(result.last!.asciiValue! - Character("a").asciiValue!)] > index {
            used[Int(result.last!.asciiValue! - Character("a").asciiValue!)] = false
            result.removeLast()
        }
        result.append(letter)
        used[Int(letter.asciiValue! - Character("a").asciiValue!)] = true
    }
    return result
}

print(removeDuplicateLetters("cbacdcbc"))
