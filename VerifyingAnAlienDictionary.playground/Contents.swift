/*
 
tags:Facebook
 
953. Verifying an Alien Dictionary
 
In an alien language, surprisingly they also use english lowercase letters, but possibly in a different order. The order of the alphabet is some permutation of lowercase letters.

 Given a sequence of words written in the alien language, and the order of the alphabet, return true if and only if the given words are sorted lexicographicaly in this alien language.

 Example 1:

 Input: words = ["hello","leetcode"], order = "hlabcdefgijkmnopqrstuvwxyz"
 Output: true
 Explanation: As 'h' comes before 'l' in this language, then the sequence is sorted.
 Example 2:

 Input: words = ["word","world","row"], order = "worldabcefghijkmnpqstuvxyz"
 Output: false
 Explanation: As 'd' comes after 'l' in this language, then words[0] > words[1], hence the sequence is unsorted.
 Example 3:

 Input: words = ["apple","app"], order = "abcdefghijklmnopqrstuvwxyz"
 Output: false
 Explanation: The first three characters "app" match, and the second string is shorter (in size.) According to lexicographical rules "apple" > "app", because 'l' > '∅', where '∅' is defined as the blank character which is less than any other character (More info).
  
 Constraints:

 1 <= words.length <= 100
 1 <= words[i].length <= 20
 order.length == 26
 All characters in words[i] and order are English lowercase letters.
 
 */
func isAlienSorted(_ words: [String], _ order: String) -> Bool {
    var dict: [Character: Int] = [:]
    for i in 0 ..< order.count {
        let c = order[order.index(order.startIndex, offsetBy: i)]
        dict[c] = i
    }
    var engWords: [String] = []
    for word in words {
        var eWord: String = ""
        for i in 0 ..< word.count {
            let c = word[word.index(word.startIndex, offsetBy: i)]
            let cIndex = dict[c]!
            let ec = String(UnicodeScalar(Character("a").asciiValue! + UInt8(cIndex)))
            eWord.append(ec)
        }
        engWords.append(eWord)
    }
    var prev = engWords[0]
    for i in 1 ..< engWords.count {
        if engWords[i] < prev {
            return false
        }
        prev = engWords[i]
    }
    return true
}

let words = ["hello","leetcode"]
let order = "hlabcdefgijkmnopqrstuvwxyz"
isAlienSorted(words, order)

let words2 = ["word","world","row"]
let order2 = "worldabcefghijkmnpqstuvxyz"
isAlienSorted(words2, order2)
