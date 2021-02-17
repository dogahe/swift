/*
 Letter Case Permutation

 Given a string S, we can transform every letter individually to be lowercase or uppercase to create another string.

 Return a list of all possible strings we could create. You can return the output in any order.

  
 Example 1:

 Input: S = "a1b2"
 Output: ["a1b2","a1B2","A1b2","A1B2"]
 Example 2:

 Input: S = "3z4"
 Output: ["3z4","3Z4"]
 Example 3:

 Input: S = "12345"
 Output: ["12345"]
 Example 4:

 Input: S = "0"
 Output: ["0"]
  

 Constraints:

 S will be a string with length between 1 and 12.
 S will consist only of letters or digits.

*/

import Foundation

func letterCasePermutation(_ S: String) -> [String] {
    var output: [String] = []
    let curr: String = ""
    helper(S, curr, &output)
    return output
}

func helper(_ S: String, _ curr: String, _ output: inout [String]) {
    if curr.count == S.count {
        output.append(curr)
        return
    }
    let i = curr.count
    let letter = S[S.index(S.startIndex, offsetBy: i)]
    if letter.isLetter {
        let lower = letter.lowercased()
        helper(S, curr + lower, &output)
        let upper = letter.uppercased()
        helper(S, curr + upper, &output)
    } else {
        helper(S, curr + String(letter), &output)
    }
}


let S = "a1b2"
let output = letterCasePermutation(S)
print(output)
