/*
 
 tags:Facebook
 
 249. Group Shifted Strings
 
 We can shift a string by shifting each of its letters to its successive letter.

 For example, "abc" can be shifted to be "bcd".
 We can keep shifting the string to form a sequence.

 For example, we can keep shifting "abc" to form the sequence: "abc" -> "bcd" -> ... -> "xyz".
 Given an array of strings strings, group all strings[i] that belong to the same shifting sequence. You may return the answer in any order.

 Example 1:
 Input: strings = ["abc","bcd","acef","xyz","az","ba","a","z"]
 Output: [["acef"],["a","z"],["abc","bcd","xyz"],["az","ba"]]
 
 Example 2:
 Input: strings = ["a"]
 Output: [["a"]]
  
 Constraints:
 1 <= strings.length <= 200
 1 <= strings[i].length <= 50
 strings[i] consists of lowercase English letters.
 
 */

import Foundation

func groupStrings(_ strings: [String]) -> [[String]] {
    var dict: [String: [String]] = [:]
    for str in strings {
        let strArr: [Character] = Array(str)
        let offset = strArr[0].asciiValue! - Character("a").asciiValue!
        var key = ""
        for i in 0 ..< str.count {
            var charVal = strArr[i].asciiValue! - offset
            if charVal < Character("a").asciiValue! {
                charVal += 26
            }
            key += String(UnicodeScalar(charVal))
        }
        if let val = dict[key] {
            var newVal = val
            newVal.append(str)
            dict[key] = newVal
        } else {
            dict[key] = [str]
        }
    }
    
    var output: [[String]] = []
    for (_, (_, value)) in dict.enumerated() {
        output.append(value)
    }
    return output
}

let strings = ["abc","bcd","acef","xyz","az","ba","a","z"]
groupStrings(strings)

let strings2 = ["a"]
groupStrings(strings2)
