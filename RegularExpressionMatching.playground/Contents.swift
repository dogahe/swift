/*
 
 tags:Facebook
 
 10. Regular Expression Matching
 
 Given an input string s and a pattern p, implement regular expression matching with support for '.' and '*' where:

 '.' Matches any single character.
 '*' Matches zero or more of the preceding element.
 The matching should cover the entire input string (not partial).

 Example 1:
 Input: s = "aa", p = "a"
 Output: false
 Explanation: "a" does not match the entire string "aa".
 
 Example 2:
 Input: s = "aa", p = "a*"
 Output: true
 Explanation: '*' means zero or more of the preceding element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".
 
 Example 3:
 Input: s = "ab", p = ".*"
 Output: true
 Explanation: ".*" means "zero or more (*) of any character (.)".
 
 Example 4:
 Input: s = "aab", p = "c*a*b"
 Output: true
 Explanation: c can be repeated 0 times, a can be repeated 1 time. Therefore, it matches "aab".
 
 Example 5:
 Input: s = "mississippi", p = "mis*is*p*."
 Output: false
  
 Constraints:

 1 <= s.length <= 20
 1 <= p.length <= 30
 s contains only lowercase English letters.
 p contains only lowercase English letters, '.', and '*'.
 It is guaranteed for each appearance of the character '*', there will be a previous valid character to match.
 
 */

func isMatch(_ s: String, _ p: String) -> Bool {
    if p.isEmpty {
        return s.isEmpty
    }
    let firstMatch = !s.isEmpty && (p.first! ==  s.first! || p.first! == ".")
    if p.count >= 2 && p[p.index(p.startIndex, offsetBy: 1)] == "*" {
        return isMatch(s, String(p.suffix(p.count - 2))) || (firstMatch && isMatch(String(s.suffix(s.count - 1)), p))
    } else {
        return firstMatch && isMatch(String(s.suffix(s.count - 1)), String(p.suffix(p.count - 1)))
    }
}


let s = "aa", p = "a"
isMatch(s, p)

let s2 = "aa", p2 = "a*"
isMatch(s2, p2)

let s3 = "ab", p3 = ".*"
isMatch(s3, p3)

let s4 = "aab", p4 = "c*a*b"
isMatch(s4, p4)

let s5 = "mississippi", p5 = "mis*is*p*."
isMatch(s5, p5)


