/*
 Longest Common Prefix
 

 Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string "".
 
 Example 1:

 Input: strs = ["flower","flow","flight"]
 Output: "fl"
 Example 2:

 Input: strs = ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.
  

 Constraints:

 0 <= strs.length <= 200
 0 <= strs[i].length <= 200
 strs[i] consists of only lower-case English letters.
 
 */
import Foundation

func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.count == 0 {
        return ""
    }
    let first: String = strs[0]
    
    var pre: String = ""
    for i in 0 ..< first.count {
        let c = first[first.index(first.startIndex, offsetBy: i)]
        pre = pre + String(c)
        var jj = 0
        for j in 1 ..< strs.count {
            let word = strs[j]
            if !word.starts(with: pre) {
                break
            }
            jj = j
        }
        if jj < strs.count - 1 {
            return String(pre.dropLast())
        }
    }
    return pre
}

let strs = ["dog","racecar","car"]//["flower","flow","flight"]
longestCommonPrefix(strs)


