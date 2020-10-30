/*
 Buddy Strings
 Given two strings A and B of lowercase letters, return true if you can swap two letters in A so the result is equal to B, otherwise, return false.

 Swapping letters is defined as taking two indices i and j (0-indexed) such that i != j and swapping the characters at A[i] and A[j]. For example, swapping at indices 0 and 2 in "abcd" results in "cbad".

  

 Example 1:

 Input: A = "ab", B = "ba"
 Output: true
 Explanation: You can swap A[0] = 'a' and A[1] = 'b' to get "ba", which is equal to B.
 Example 2:

 Input: A = "ab", B = "ab"
 Output: false
 Explanation: The only letters you can swap are A[0] = 'a' and A[1] = 'b', which results in "ba" != B.
 Example 3:

 Input: A = "aa", B = "aa"
 Output: true
 Explanation: You can swap A[0] = 'a' and A[1] = 'a' to get "aa", which is equal to B.
 Example 4:

 Input: A = "aaaaaaabc", B = "aaaaaaacb"
 Output: true
 Example 5:

 Input: A = "", B = "aa"
 Output: false
  
 Constraints:

 0 <= A.length <= 20000
 0 <= B.length <= 20000
 A and B consist of lowercase letters.
 
*/
import Foundation

func buddyStrings(_ A: String, _ B: String) -> Bool {
    if A.count != B.count {
        return false
    }
    if A == B  {
        var letters: [Character: Int] = [:]
        for index in 0 ..< A.count {
            let letter = A[A.index(A.startIndex, offsetBy: index)]
            if letters[letter] != nil {
                letters[letter] = letters[letter]! + 1
            } else {
                letters[letter] = 1
            }
        }
        for (_, value) in letters {
            if value > 1 {
                return true
            }
        }
        return false
    } else {
        var numOfDiffs: Int = 0
        var firstLetter: Character?
        var secondLetter: Character?
        for index in 0 ..< A.count {
            let letterA = A[A.index(A.startIndex, offsetBy: index)]
            let letterB = B[B.index(B.startIndex, offsetBy: index)]
            if letterA != letterB {
                numOfDiffs += 1
                if numOfDiffs == 1 {
                    firstLetter = letterA
                    secondLetter = letterB
                } else if numOfDiffs == 2 {
                    if !(firstLetter! == letterB && secondLetter! == letterA) {
                        return false
                    }
                }
            }
            if numOfDiffs > 2 {
                return false
            }
        }
        if numOfDiffs == 2 {
            return true
        }
        return false
    }
}

let A = "abcispol"
let B = "abcsipoi"

print(buddyStrings(A, B))
