/*
 692. Top K Frequent Words
 
 Given a non-empty list of words, return the k most frequent elements.

 Your answer should be sorted by frequency from highest to lowest. If two words have the same frequency, then the word with the lower alphabetical order comes first.

 Example 1:

 Input: ["i", "love", "leetcode", "i", "love", "coding"], k = 2
 Output: ["i", "love"]
 Explanation: "i" and "love" are the two most frequent words.
     Note that "i" comes before "love" due to a lower alphabetical order.
 Example 2:

 Input: ["the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"], k = 4
 Output: ["the", "is", "sunny", "day"]
 Explanation: "the", "is", "sunny" and "day" are the four most frequent words,
     with the number of occurrence being 4, 3, 2 and 1 respectively.
 Note:

 You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
 Input words contain only lowercase letters.
 Follow up:

 Try to solve it in O(n log k) time and O(n) extra space.
 
 */
import Foundation

func topKFrequent(_ words: [String], _ k: Int) -> [String] {
    var dict: [String:Int] = [:]
    for word in words {
        if let val = dict[word] {
            dict[word] = val + 1
        } else {
            dict[word] = 1
        }
    }
    let sortedDict = dict.sorted {
        if $0.1 > $1.1 {
            return true
        } else if  $0.1 == $1.1 {
            return $0.0 <= $1.0
        } else {
            return false
        }
    }
    var output: [String] = []
    for (i, (key, val)) in sortedDict.enumerated() {
        if i == k {
            break
        }
        output.append(key)
    }
    return output
}

let words = ["the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"]
let k = 4
topKFrequent(words, k)
