/*
 
 tags:Facebook
 
 139. Word Break
 
 Given a string s and a dictionary of strings wordDict, return true if s can be segmented into a space-separated sequence of one or more dictionary words.

 Note that the same word in the dictionary may be reused multiple times in the segmentation.

  

 Example 1:
 Input: s = "leetcode", wordDict = ["leet","code"]
 Output: true
 Explanation: Return true because "leetcode" can be segmented as "leet code".

 Example 2:
 Input: s = "applepenapple", wordDict = ["apple","pen"]
 Output: true
 Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
 Note that you are allowed to reuse a dictionary word.
 
 Example 3:
 Input: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
 Output: false
  
 Constraints:
 1 <= s.length <= 300
 1 <= wordDict.length <= 1000
 1 <= wordDict[i].length <= 20
 s and wordDict[i] consist of only lowercase English letters.
 All the strings of wordDict are unique.
 
 */

func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    var results: [String: Bool] = [:]
    return helper(s, wordDict, &results)
}


func helper(_ s: String, _ wordDict: [String], _ results: inout [String: Bool]) -> Bool {
    if let val = results[s] {
        return val
    }
    if s.isEmpty {
        return true
    }
    for word in wordDict {
        if s.starts(with: word) {
            var rem = s
            rem = String(rem.suffix(s.count - word.count))
            if helper(rem, wordDict, &results) {
                results[s] = true
                return true
            }
        }
    }
    results[s] = false
    return false
}

let s = "leetcode", wordDict = ["leet","code"]
wordBreak(s, wordDict)

let s2 = "applepenapple", wordDict2 = ["apple","pen"]
wordBreak(s2, wordDict2)

let s3 = "catsandog", wordDict3 = ["cats","dog","sand","and","cat"]
wordBreak(s3, wordDict3)

let s4 = "cars", wordDict4 = ["car","ca","rs"]
wordBreak(s4, wordDict4)
