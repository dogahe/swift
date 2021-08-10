/*
 
 tags:Google
 
 159. Longest Substring with At Most Two Distinct Characters
 
 Given a string s, return the length of the longest substring that contains at most two distinct characters.

 Example 1:
 Input: s = "eceba"
 Output: 3
 Explanation: The substring is "ece" which its length is 3.
 
 Example 2:
 Input: s = "ccaabbb"
 Output: 5
 Explanation: The substring is "aabbb" which its length is 5.
  
 Constraints:
 1 <= s.length <= 104
 s consists of English letters.
 */

func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {
    let sArr: [Character] = Array(s)
    var dc = 0
    var dict: [Character: Int] = [:]
    var l = 0
    var r = 0
    var longest = Int.min
    while r < sArr.count {
        let c = sArr[r]
        if let val = dict[c], val > 0 {
            dict[c] = val + 1
        } else {
            dict[c] = 1
            dc += 1
        }
        while dc > 2 && l <= r {
            let c = sArr[l]
            if let val = dict[c] {
                dict[c] = val - 1
                if val - 1 == 0 {
                    dc -= 1
                }
            }
            l += 1
        }
        longest = max(longest, r - l + 1)
        r += 1
    }
    return longest
}

let s = "eceba"
lengthOfLongestSubstringTwoDistinct(s)

let s2 = "ccaabbb"
lengthOfLongestSubstringTwoDistinct(s2)
    
