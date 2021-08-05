/*
 
 tags:Google
 
 205. Isomorphic Strings
 
 Given two strings s and t, determine if they are isomorphic.

 Two strings s and t are isomorphic if the characters in s can be replaced to get t.

 All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character, but a character may map to itself.

  

 Example 1:
 Input: s = "egg", t = "add"
 Output: true
 
 Example 2:
 Input: s = "foo", t = "bar"
 Output: false
 
 Example 3:
 Input: s = "paper", t = "title"
 Output: true
  
 Constraints:
 1 <= s.length <= 5 * 104
 t.length == s.length
 s and t consist of any valid ascii character.
 
 */
func isIsomorphic(_ s: String, _ t: String) -> Bool {
    if s.count != t.count {
        return false
    }
    let sArr: [Character] = Array(s)
    let tArr: [Character] = Array(t)
    var dict: [Character:Character] = [:]
    var reverseDict: [Character:Character] = [:]
    var converted: String = ""
    for i in 0 ..< s.count {
        if let val = dict[sArr[i]] {
            converted.append(val)
        } else {
            if reverseDict[tArr[i]] != nil {
                return false
            } else {
                dict[sArr[i]] = tArr[i]
                reverseDict[tArr[i]] = sArr[i]
                converted.append(tArr[i])
            }
        }
    }
    return converted == t
}

let s = "egg", t = "add"
isIsomorphic(s, t)

let s2 = "foo", t2 = "bar"
isIsomorphic(s2, t2)

let s3 = "paper", t3 = "title"
isIsomorphic(s3, t3)

let s4 = "badc", t4 = "baba"
isIsomorphic(s4, t4)


