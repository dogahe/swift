//
//  main.swift
//  MinimumWindowSubstring
//
//  Created by Behzad Dogahe on 5/26/21.
//

/*
 
 76. Minimum Window Substring
 
 
 Given two strings s and t of lengths m and n respectively, return the minimum window in s which will contain all the characters in t. If there is no such window in s that covers all characters in t, return the empty string "".

 Note that If there is such a window, it is guaranteed that there will always be only one unique minimum window in s.

  

 Example 1:

 Input: s = "ADOBECODEBANC", t = "ABC"
 Output: "BANC"
 Example 2:

 Input: s = "a", t = "a"
 Output: "a"
  

 Constraints:

 m == s.length
 n == t.length
 1 <= m, n <= 105
 s and t consist of English letters.
  

 Follow up: Could you find an algorithm that runs in O(m + n) time?
 
 */
func minWindow(_ s: String, _ t: String) -> String {
    var dictT: [Character:Int] = [:]
    let tArr: [Character] = Array(t)
    for i in 0 ..< tArr.count {
        let c = tArr[i]
        if let val = dictT[c] {
            dictT[c] = val + 1
        } else {
            dictT[c] = 1
        }
    }
    
    let requiredMatches = dictT.count
    var l = 0, r = 0, matches = 0
    var dictW: [Character:Int] = [:]
    var window: [Int] = [-1, 0, 0]
    
    let sArr: [Character] = Array(s)
    while r < sArr.count {
        let c = sArr[r]
        if let val = dictW[c] {
            dictW[c] = val + 1
        } else {
            dictW[c] = 1
        }
        if let tVal = dictT[c], tVal ==  dictW[c] {
            matches += 1
        }

        while matches == requiredMatches && l <= r {
            if window[0] == -1 || r - l + 1 < window[0] {
                window[0] = r - l + 1
                window[1] = l
                window[2] = r
            }
            
            let c = sArr[l]
            if let val = dictW[c] {
                dictW[c] = val - 1
                if let tVal = dictT[c], tVal > val - 1 {
                    matches -= 1
                }
            }
            l += 1
        }
        r += 1
    }
    if window[0] == -1 {
        return ""
    }
    return String(s[s.index(s.startIndex, offsetBy: window[1])...s.index(s.startIndex, offsetBy: window[2])])
}

let s = "ADOBECODEBANC"//""//"A"//
let t = "ABC"//""//"AA"//

print(minWindow(s, t))
