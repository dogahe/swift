/*
 
 tags:Facebook
 
 49. Group Anagrams
 
 Given an array of strings strs, group the anagrams together. You can return the answer in any order.

 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

  

 Example 1:

 Input: strs = ["eat","tea","tan","ate","nat","bat"]
 Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
 Example 2:

 Input: strs = [""]
 Output: [[""]]
 Example 3:

 Input: strs = ["a"]
 Output: [["a"]]
  

 Constraints:

 1 <= strs.length <= 104
 0 <= strs[i].length <= 100
 strs[i] consists of lower-case English letters.
 */

import Foundation

func groupAnagrams(_ strs: [String]) -> [[String]] {
    let sortedStrs = strs.map { String($0.sorted()) }
    var dict: [String:[String]] = [:]
    for i in 0 ..< strs.count {
        if let val = dict[sortedStrs[i]] {
            var newVal = val
            newVal.append(strs[i])
            dict[sortedStrs[i]] = newVal
        } else {
            dict[sortedStrs[i]] = [strs[i]]
        }
    }
    var output: [[String]] = []
    for (index,(key, val)) in dict.enumerated() {
        output.append(val)
    }
    return output
}

func groupAnagramsFaster(_ strs: [String]) -> [[String]] {
    var dict: [String: [String]] = [:]
    for i in 0 ..< strs.count {
        var countArr: [Int] = Array(repeating: 0, count: 26)
        let str = strs[i]
        for c in str {
            countArr[Int(c.asciiValue! - Character("a").asciiValue!)] += 1
        }
        let countStr = countArr.map( { String($0) } ).joined(separator: "#")
        if let val = dict[countStr] {
            var newVal = val
            newVal.append(strs[i])
            dict[countStr] = newVal
        } else {
            dict[countStr] = [strs[i]]
        }
    }
    var output: [[String]] = []
    for (index,(key, val)) in dict.enumerated() {
        output.append(val)
    }
    return output
}

let strs = ["eat","tea","tan","ate","nat","bat"]

groupAnagrams(strs)
groupAnagramsFaster(strs)
