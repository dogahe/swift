/*
 
 tags:Google
 
 242. Valid Anagram
 
 Given two strings s and t, return true if t is an anagram of s, and false otherwise.

 Example 1:
 Input: s = "anagram", t = "nagaram"
 Output: true
 
 Example 2:
 Input: s = "rat", t = "car"
 Output: false
  
 Constraints:

 1 <= s.length, t.length <= 5 * 104
 s and t consist of lowercase English letters.
  
 Follow up: What if the inputs contain Unicode characters? How would you adapt your solution to such a case?

 */
func isAnagram(_ s: String, _ t: String) -> Bool {
    let sArr: [Character] = Array(s)
    let tArr: [Character] = Array(t)
    var sCount: [Int] = Array(repeating: 0, count: 26)
    for i in 0 ..< s.count {
        let c = sArr[i]
        sCount[Int(c.asciiValue! - Character("a").asciiValue!)] += 1
    }
    for i in 0 ..< t.count {
        let c = tArr[i]
        sCount[Int(c.asciiValue! - Character("a").asciiValue!)] -= 1
    }
    for i in 0 ... 25 {
        if sCount[i] != 0 {
            return false
        }
    }
    return true
}

let s = "anagram", t = "nagaram"
isAnagram(s,t)

let s2 = "rat", t2 = "car"
isAnagram(s2,t2)
