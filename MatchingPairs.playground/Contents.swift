/*
 
 tags:Facebook
 
 Matching Pairs
 Given two strings s and t of length N, find the maximum number of possible matching pairs in strings s and t after swapping exactly two characters within s.
 A swap is switching s[i] and s[j], where s[i] and s[j] denotes the character that is present at the ith and jth index of s, respectively. The matching pairs of the two strings are defined as the number of indices for which s[i] and t[i] are equal.
 Note: This means you must swap two characters at different indices.
 Signature
 int matchingPairs(String s, String t)
 Input
 s and t are strings of length N
 N is between 2 and 1,000,000
 Output
 Return an integer denoting the maximum number of matching pairs
 
 Example 1
 s = "abcd"
 t = "adcb"
 output = 4
 
 Explanation:
 Using 0-based indexing, and with i = 1 and j = 3, s[1] and s[3] can be swapped, making it  "adcb".
 Therefore, the number of matching pairs of s and t will be 4.
 
 Example 2
 s = "mno"
 t = "mno"
 output = 1
 
 Explanation:
 Two indices have to be swapped, regardless of which two it is, only one letter will remain the same. If i = 0 and j=1, s[0] and s[1] are swapped, making s = "nmo", which shares only "o" with t.
 */

// Add any extra import statements you may need here


// Add any helper functions you may need here


func matchingPairs(s: String, t: String) -> Int {
    let sArr: [Character] = Array(s)
    let tArr: [Character] = Array(t)
    var matched: Set<Character> = []
    var unmatched: Set<String> = []
    var hasDuplicate = false
    var matchCount = 0
    for i in 0 ..< sArr.count {
        if sArr[i] == tArr[i] {
            if matched.contains(sArr[i]) {
                hasDuplicate = true
            }
            matched.insert(sArr[i])
            matchCount += 1
        } else {
            unmatched.insert(String(sArr[i]) + String(tArr[i]))
        }
    }
    
    if matchCount == s.count {
        if hasDuplicate {
            return matchCount
        } else {
            return matchCount - 2
        }
    }
    
    
    if matchCount == s.count - 1 {
        let onlyOneUnmatched = unmatched.first!
        let s1 = String(onlyOneUnmatched.first!)
        let t1 = String(onlyOneUnmatched.last!)
        if hasDuplicate || matched.contains(Character(s1)) || matched.contains(Character(t1)) {
            return matchCount
        }
        return matchCount - 1
    }
    
    for um in unmatched {
        let s1 = String(um.first!)
        let t1 = String(um.last!)
        if unmatched.contains(t1 + s1) {
            return matchCount + 2
        }
    }
    
    var unmatchedS: Set<Character> = []
    var unmatchedT: Set<Character> = []
    
    for um in unmatched {
        let s1 = String(um.first!)
        let t1 = String(um.last!)
        if unmatchedS.contains(Character(t1)) || unmatchedT.contains(Character(s1)) {
            return matchCount + 1
        }
        unmatchedS.insert(Character(s1))
        unmatchedT.insert(Character(t1))
    }
    
    return matchCount
}

// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom.

var test_case_number = 1
func check(expected: Int, output: Int) {
  let result = expected == output
  let rightTick = "\u{2713}"
  let wrongTick = "\u{2717}"
    
  if result {
      print("\(rightTick) Test #\(test_case_number)")
  } else {
      print("\(wrongTick) Test # \(test_case_number): Expected [\(expected)] Your output: [\(output)]")
  }
  test_case_number += 1
}

let s1 = "abcde"
let t1 = "adcbe"
let expected1 = 5
let output1 = matchingPairs(s: s1, t: t1)
check(expected: expected1, output: output1)

let s2 = "abcd"
let t2 = "abcd"
let expected2 = 2
let output2 = matchingPairs(s: s2, t: t2)
check(expected: expected2, output: output2)
    
// Add your own test cases here


