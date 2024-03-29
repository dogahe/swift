/*
 
 tags:Google
 
 833. Find And Replace in String
 
 You are given a 0-indexed string s that you must perform k replacement operations on. The replacement operations are given as three 0-indexed parallel arrays, indices, sources, and targets, all of length k.

 To complete the ith replacement operation:

 Check if the substring sources[i] occurs at index indices[i] in the original string s.
 If it does not occur, do nothing.
 Otherwise if it does occur, replace that substring with targets[i].
 For example, if s = "abcd", indices[i] = 0, sources[i] = "ab", and targets[i] = "eee", then the result of this replacement will be "eeecd".

 All replacement operations must occur simultaneously, meaning the replacement operations should not affect the indexing of each other. The testcases will be generated such that the replacements will not overlap.

 For example, a testcase with s = "abc", indices = [0, 1], and sources = ["ab","bc"] will not be generated because the "ab" and "bc" replacements overlap.
 Return the resulting string after performing all replacement operations on s.

 A substring is a contiguous sequence of characters in a string.

 Example 1:
 Input: s = "abcd", indices = [0, 2], sources = ["a", "cd"], targets = ["eee", "ffff"]
 Output: "eeebffff"
 Explanation:
 "a" occurs at index 0 in s, so we replace it with "eee".
 "cd" occurs at index 2 in s, so we replace it with "ffff".
 
 Example 2:
 Input: s = "abcd", indices = [0, 2], sources = ["ab","ec"], targets = ["eee","ffff"]
 Output: "eeecd"
 Explanation:
 "ab" occurs at index 0 in s, so we replace it with "eee".
 "ec" does not occur at index 2 in s, so we do nothing.
  

 Constraints:
 1 <= s.length <= 1000
 k == indices.length == sources.length == targets.length
 1 <= k <= 100
 0 <= indexes[i] < s.length
 1 <= sources[i].length, targets[i].length <= 50
 s consists of only lowercase English letters.
 sources[i] and targets[i] consist of only lowercase English letters.
 */


func findReplaceString(_ s: String, _ indices: [Int], _ sources: [String], _ targets: [String]) -> String {
    var str = s
    var offset = 0
    var sortedIndices: [(Int, Int)] = []
    for i in 0 ..< indices.count {
        sortedIndices.append((indices[i], i))
    }
    sortedIndices.sort(by: { $0.0 < $1.0 } )
    for i in 0 ..< sortedIndices.count {
        let index = sortedIndices[i].0
        let left = str.index(str.startIndex, offsetBy: index + offset)
        let right = str.index(str.startIndex, offsetBy: index + sources[sortedIndices[i].1].count - 1 + offset)
        let sub = str[left ... right]
        if sub == sources[sortedIndices[i].1] {
            str.replaceSubrange(left ... right, with: targets[sortedIndices[i].1])
            offset += targets[sortedIndices[i].1].count - sources[sortedIndices[i].1].count
        }
    }
    return str
}

struct Replacement {
    let index: Int
    let source: String
    let target: String
}
func findReplaceString2(_ s: String, _ indices: [Int], _ sources: [String], _ targets: [String]) -> String {
    var str = s
    var offset = 0
    var replacements: [Replacement] = []
    for i in 0 ..< indices.count {
        let replacement = Replacement(index: indices[i], source: sources[i], target: targets[i])
        replacements.append(replacement)
    }
    replacements.sort(by:  { $0.index < $1.index } )
    for replacement in replacements {
        let left = str.index(str.startIndex, offsetBy: replacement.index + offset)
        let right = str.index(str.startIndex, offsetBy: replacement.index + replacement.source.count - 1 + offset)
        let sub = str[left ... right]
        if sub == replacement.source {
            str.replaceSubrange(left ... right, with: replacement.target)
            offset += replacement.target.count - replacement.source.count
        }
    }
    return str
}


let s = "abcd", indices = [0, 2], sources = ["a", "cd"], targets = ["eee", "ffff"]
findReplaceString(s, indices, sources, targets)
findReplaceString2(s, indices, sources, targets)

let s2 = "abcd", indices2 = [0, 2], sources2 = ["ab","ec"], targets2 = ["eee","ffff"]
findReplaceString(s2, indices2, sources2, targets2)
findReplaceString2(s2, indices2, sources2, targets2)

let s3 = "vmokgggqzp", indices3 = [3,5,1], sources3 = ["kg","ggq","mo"], targets3 = ["s","so","bfr"]
findReplaceString(s3, indices3, sources3, targets3)
findReplaceString2(s3, indices3, sources3, targets3)




