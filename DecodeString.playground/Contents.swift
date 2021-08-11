/*
 
 tags:Google
 
 Decode String
 
 Given an encoded string, return its decoded string.

 The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is being repeated exactly k times. Note that k is guaranteed to be a positive integer.

 You may assume that the input string is always valid; No extra white spaces, square brackets are well-formed, etc.

 Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, k. For example, there won't be input like 3a or 2[4].

 Example 1:

 Input: s = "3[a]2[bc]"
 Output: "aaabcbc"
 Example 2:

 Input: s = "3[a2[c]]"
 Output: "accaccacc"
 Example 3:

 Input: s = "2[abc]3[cd]ef"
 Output: "abcabccdcdcdef"
 Example 4:

 Input: s = "abc3[cd]xyz"
 Output: "abccdcdcdxyz"
  

 Constraints:

 1 <= s.length <= 30
 s consists of lowercase English letters, digits, and square brackets '[]'.
 s is guaranteed to be a valid input.
 All the integers in s are in the range [1, 300].

 */

import Foundation

func decodeString(_ s: String) -> String {
    return doDecode(s)
}

func doDecode(_ s: String) -> String {
    if !s.contains("[") {
        return s
    } else {
        var index: Int = 0
        var num: Int = 0
        var str: String = ""
        while index < s.count {
            let letter = s[s.index(s.startIndex, offsetBy: index)]
            if letter.isNumber {
                if let digit = letter.wholeNumberValue {
                    num = num*10 + digit
                }
                index += 1
            } else if letter == "[" {
                let strIndex = s.index(s.startIndex, offsetBy: index + 1)
                let r = findBetweenBrackets(String(s.suffix(from: strIndex)))
                str += String(repeating: doDecode(r), count: num)
                num = 0
                index += r.count + 2
            } else {
                str += String(letter)
                index += 1
            }
        }
        return str
    }
}

func findBetweenBrackets(_ s: String) -> String {
    var count: Int = 1
    var index: Int = 0
    var str: String = ""
    while index < s.count {
        let letter = s[s.index(s.startIndex, offsetBy: index)]
        if letter == "[" {
            count += 1
            str += String(letter)
        } else if letter == "]" {
            count -= 1
            if count == 0 {
                break
            }
            str += String(letter)
        } else {
            str += String(letter)
        }
        index += 1
    }
    return str
}

// Much Simpler Solution
func decodeStringSimpler(_ s: String) -> String {
    var index: Int = 0
    return doDecode(s, &index)
}

func doDecode(_ s: String, _ index: inout Int) -> String {
    let sArr: [Character] = Array(s)
    var output: String = ""
    while index < s.count && sArr[index] != "]" {
        if !sArr[index].isNumber {
            output.append(sArr[index])
            index += 1
        } else {
            var num = 0
            while sArr[index].isNumber {
                if let digit = sArr[index].wholeNumberValue {
                    num = num*10 + digit
                }
                index += 1
            }
            index += 1 // Skipping [
            let decodedString = doDecode(s, &index)
            index += 1 // skipping ]
            output.append(String(repeating: decodedString, count: num))
        }
    }
    return output
}


var s = "3[a2[c]]"//"12[ab]"//"abc3[cd]xyz"//"2[abc]3[cd]ef"//"3[a]2[bc]"

decodeString(s)
decodeStringSimpler(s)

s = "2[abc]3[cd]ef"

decodeString(s)
decodeStringSimpler(s)
