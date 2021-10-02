/*
 
 408. Valid Word Abbreviation
 
 A string can be abbreviated by replacing any number of non-adjacent, non-empty substrings with their lengths. The lengths should not have leading zeros.

 For example, a string such as "substitution" could be abbreviated as (but not limited to):

 "s10n" ("s ubstitutio n")
 "sub4u4" ("sub stit u tion")
 "12" ("substitution")
 "su3i1u2on" ("su bst i t u ti on")
 "substitution" (no substrings replaced)
 The following are not valid abbreviations:

 "s55n" ("s ubsti tutio n", the replaced substrings are adjacent)
 "s010n" (has leading zeros)
 "s0ubstitution" (replaces an empty substring)
 Given a string word and an abbreviation abbr, return whether the string matches the given abbreviation.

 A substring is a contiguous non-empty sequence of characters within a string.

 Example 1:
 Input: word = "internationalization", abbr = "i12iz4n"
 Output: true
 Explanation: The word "internationalization" can be abbreviated as "i12iz4n" ("i nternational iz atio n").
 
 Example 2:
 Input: word = "apple", abbr = "a2e"
 Output: false
 Explanation: The word "apple" cannot be abbreviated as "a2e".
  
 Constraints:
 1 <= word.length <= 20
 word consists of only lowercase English letters.
 1 <= abbr.length <= 10
 abbr consists of lowercase English letters and digits.
 All the integers in abbr will fit in a 32-bit integer.
 
 */
func validWordAbbreviation(_ word: String, _ abbr: String) -> Bool {
    let wordArr: [Character] = Array(word)
    let abbrArr: [Character] = Array(abbr)
    var i = 0
    var j = 0
    while i < wordArr.count && j < abbrArr.count {
        if wordArr[i] == abbrArr[j] {
            i += 1
            j += 1
            continue
        }
        if abbrArr[j].isLetter {
            return false
        }
        var numStr = ""
        while j < abbrArr.count && abbrArr[j].isNumber {
            numStr += String(abbrArr[j])
            if numStr.starts(with: "0") {
                return false
            }
            j += 1
        }
        let num = Int(numStr)!
        i += num
    }
    return i == wordArr.count && j == abbrArr.count
}

let word = "internationalization", abbr = "i12iz4n"
validWordAbbreviation(word, abbr)

let word2 = "apple", abbr2 = "a2e"
validWordAbbreviation(word2, abbr2)

let word3 = "substitution", abbr3 = "substitution"//"su3i1u2on"//"sub4u4" // "12" //, "s10n",
validWordAbbreviation(word3, abbr3)

let word4 = "hi", abbr4 = "hi1"
validWordAbbreviation(word4, abbr4)
