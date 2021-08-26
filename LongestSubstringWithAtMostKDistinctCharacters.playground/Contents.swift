/*
 
 tags:Facebook
 
 340. Longest Substring with At Most K Distinct Characters
 
 Given a string s and an integer k, return the length of the longest substring of s that contains at most k distinct characters.

 Example 1:
 Input: s = "eceba", k = 2
 Output: 3
 Explanation: The substring is "ece" with length 3.
 
 Example 2:
 Input: s = "aa", k = 1
 Output: 2
 Explanation: The substring is "aa" with length 2.
  
 Constraints:

 1 <= s.length <= 5 * 104
 0 <= k <= 50
 
 */
func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
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
        while dc > k && l <= r {
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

let s = "eceba", k = 2
lengthOfLongestSubstringKDistinct(s, k)

let s2 = "aa", k2 = 1
lengthOfLongestSubstringKDistinct(s2, k2)

