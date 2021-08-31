/*
 
 tags:Facebook
 
 438. Find All Anagrams in a String
 
 Given two strings s and p, return an array of all the start indices of p's anagrams in s. You may return the answer in any order.

 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

 Example 1:
 Input: s = "cbaebabacd", p = "abc"
 Output: [0,6]
 Explanation:
 The substring with start index = 0 is "cba", which is an anagram of "abc".
 The substring with start index = 6 is "bac", which is an anagram of "abc".
 
 Example 2:
 Input: s = "abab", p = "ab"
 Output: [0,1,2]
 Explanation:
 The substring with start index = 0 is "ab", which is an anagram of "ab".
 The substring with start index = 1 is "ba", which is an anagram of "ab".
 The substring with start index = 2 is "ab", which is an anagram of "ab".
  

 Constraints:
 1 <= s.length, p.length <= 3 * 104
 s and p consist of lowercase English letters.
 
*/

func findAnagrams(_ s: String, _ p: String) -> [Int] {
    if s.count < p.count {
        return []
    }
    var phash = Array(repeating: 0, count: 26)
    let pArr: [Character] = Array(p)
    for i in 0 ..< p.count {
        let c = pArr[i]
        phash[Int(c.asciiValue! - Character("a").asciiValue!)] += 1
    }
    var shash = Array(repeating: 0, count: 26)
    let sArr: [Character] = Array(s)
    for i in 0 ..< p.count {
        let c = sArr[i]
        shash[Int(c.asciiValue! - Character("a").asciiValue!)] += 1
    }
    var result: [Int] = []
    var left = 0
    var right = p.count - 1
    if shash == phash {
        result.append(left)
    }
    while right < s.count - 1 {
        right += 1
        let rc = sArr[right]
        let lc = sArr[left]
        left += 1
        shash[Int(lc.asciiValue! - Character("a").asciiValue!)] -= 1
        shash[Int(rc.asciiValue! - Character("a").asciiValue!)] += 1
        if shash == phash {
            result.append(left)
        }
    }
    return result
}


func findAnagramsSlidingWindow(_ s: String, _ p: String) -> [Int] {
    if s.count < p.count {
        return []
    }
    var smap: [Int] = Array(repeating: 0, count: 26)
    var pmap: [Int] = Array(repeating: 0, count: 26)
    let aChar: Character = "a"
    let sArr: [Character] = Array(s)
    let pArr: [Character] = Array(p)
    for i in 0 ..< p.count {
        let c1 = pArr[i]
        pmap[Int(c1.asciiValue! - aChar.asciiValue!)] += 1
        let c2 = sArr[i]
        smap[Int(c2.asciiValue! - aChar.asciiValue!)] += 1
    }
    
    var output: [Int] = []
    for i in 0 ..< s.count -  p.count {
        if match(smap, pmap) {
            output.append(i)
        }
        smap[Int(sArr[i + p.count].asciiValue! - aChar.asciiValue!)] += 1
        smap[Int(sArr[i].asciiValue! - aChar.asciiValue!)] -= 1
    }
    if match(smap, pmap) {
        output.append(s.count -  p.count)
    }
    return output
}

func match(_ map1: [Int], _ map2: [Int]) -> Bool {
    for i in 0 ..< map1.count {
        if map1[i] != map2[i] {
            return false
        }
    }
    return true
}

let s = "cbaebabacd"//"abab"
let p = "abc"//"ab"
findAnagrams(s, p)
findAnagramsSlidingWindow(s, p)

let s2 = "abab"
let p2 = "ab"
findAnagrams(s2, p2)
findAnagramsSlidingWindow(s2, p2)
