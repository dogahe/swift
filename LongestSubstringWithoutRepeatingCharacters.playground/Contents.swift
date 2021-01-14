import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    var b: Int = 0
    var str: String = ""
    var lastLength: Int = 0
    var index: Int = 0
    while index < s.count {
        let c = s[s.index(s.startIndex, offsetBy: index)]
        if !str.contains(c) {
            str.append(c)
            index += 1
        } else {
            lastLength = max(lastLength, str.count)
            b += 1
            index = b + 1
            str = String(s[s.index(s.startIndex, offsetBy: b)])
        }
    }
    lastLength = max(lastLength, str.count)
    return lastLength
}

func lengthOfLongestSubstringOptimized(_ s: String) -> Int {
    var b: Int = 0
    var str: String = ""
    var lastLength: Int = 0
    var index: Int = 0
    var letters: [Character: Int] = [:]
    while index < s.count {
        let c = s[s.index(s.startIndex, offsetBy: index)]
 
        if let val = letters[c] {
            lastLength = max(lastLength, str.count)
            b = val + 1
            str = String(s[s.index(s.startIndex, offsetBy: b)..<s.index(s.startIndex, offsetBy: index)])
            letters[c] = index

        } else {
            letters[c] = index
            str.append(c)
            index += 1
        }
        
        
        if !letters.contains(c) {
            letters.insert(c)
            str.append(c)
            index += 1
        } else {
            lastLength = max(lastLength, str.count)
            let firstLetter = str.first!
            str.removeFirst()
            letters.remove(firstLetter)
            b += 1
        }
    }
    lastLength = max(lastLength, str.count)
    return lastLength
}

let s = "abcabcdeabc"

lengthOfLongestSubstring(s)
lengthOfLongestSubstringOptimized(s)
