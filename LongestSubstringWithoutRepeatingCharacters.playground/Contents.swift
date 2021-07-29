/*

tags:Google
 
3. Longest Substring Without Repeating Characters
 
 Given a string s, find the length of the longest substring without repeating characters.
 
 Example 1:
 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 
 Example 2:
 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 
 Example 3:
 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
 
 Example 4:
 Input: s = ""
 Output: 0
  
 Constraints:

 0 <= s.length <= 5 * 104
 s consists of English letters, digits, symbols and spaces.
 
*/

func lengthOfLongestSubstring(_ s: String) -> Int {
    let sArr: [Character] = Array(s)
    var left: Int = 0
    var right: Int = 0
    var maxLength: Int = 0
    var dict: [Character: Int] = [:]
    while right < sArr.count {
        let c = sArr[right]
        if let val = dict[c] {
            var value = val
            while value > 0 {
                dict[sArr[left]]! -= 1
                left += 1
                value = dict[c]!
            }
        }
        dict[c] = 1
        maxLength = max(maxLength, right - left + 1)
        right += 1
    }
    return maxLength
}

let s = "abcabcdeabc"
lengthOfLongestSubstring(s)

