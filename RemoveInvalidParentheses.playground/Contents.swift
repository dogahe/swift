
/*
 
 tags: Facebook
 
 301. Remove Invalid Parentheses
 
 Given a string s that contains parentheses and letters, remove the minimum number of invalid parentheses to make the input string valid.

 Return all the possible results. You may return the answer in any order.

 Example 1:
 Input: s = "()())()"
 Output: ["(())()","()()()"]
 
 Example 2:
 Input: s = "(a)())()"
 Output: ["(a())()","(a)()()"]
 
 Example 3:
 Input: s = ")("
 Output: [""]
  
 Constraints:
 1 <= s.length <= 25
 s consists of lowercase English letters and parentheses '(' and ')'.
 There will be at most 20 parentheses in s.
 
*/
// First Solution
/*
func removeInvalidParentheses(_ s: String) -> [String] {
    let sArr: [Character] = Array(s)
    var result: Set<String> = []
    helper(sArr, 0, "", 0, 0, &result)
    var maxLength = Int.min
    for r in result {
        maxLength = max(maxLength, r.count)
    }
    var output: [String] = []
    for r in result {
        if r.count == maxLength {
            output.append(r)
        }
    }
    return output
}


func helper(_ s: [Character], _ index: Int, _ curr: String, _ open: Int, _ close: Int, _ result: inout Set<String>) {
    if index == s.count {
        if open == close {
            result.insert(curr)
        }
        return
    }
    let c = s[index]
    
    if c != "(" && c != ")" {
        helper(s, index + 1, curr + String(c), open, close, &result)
    } else {
        // Add to curr
        if c == "(" {
            if index < s.count - 1 {
                helper(s, index + 1, curr + "(", open + 1, close, &result)
            }
        } else { // it's a )
            if open > close {
                helper(s, index + 1, curr + ")", open, close + 1, &result)
            }
        }
        // Skip the parenthesis. Do not add to curr
        helper(s, index + 1, curr, open, close, &result)
    }
}
*/


// Second Solution: More optimization
/*
 For every left parenthesis, we should have a corresponding right parenthesis. We can make use of two counters which keep track of misplaced left and right parenthesis and in one iteration we can find out these two values.
 0 1 2 3 4 5 6 7
 ( ) ) ) ( ( ( )
 i = 0, left = 1, right = 0
 i = 1, left = 0, right = 0
 i = 2, left = 0, right = 1
 i = 3, left = 0, right = 2
 i = 4, left = 1, right = 2
 i = 5, left = 2, right = 2
 i = 6, left = 3, right = 2
 i = 7, left = 2, right = 2
 We have 2 misplaced left and 2 misplaced right parentheses.
 
 We found out that the exact number of left and right parenthesis that has to be removed to get a valid expression. So, e.g. in a 1000 parentheses string, if there are 2 misplaced left and 2 misplaced right parentheses, after we are done discarding 2 left and 2 right parentheses, we will have only one option per remaining character in the expression i.e. to consider them. We can't discard them.
 */

func removeInvalidParentheses(_ s: String) -> [String] {
    let sArr: [Character] = Array(s)
    var left = 0
    var right = 0
    for i in 0 ..< sArr.count {
        if sArr[i] == "(" {
            left += 1
        } else if sArr[i] == ")" {
            if left > 0 {
                left -= 1
            } else {
                right += 1
            }
        }
    }
    var result: Set<String> = []
    helper(sArr, 0, "", 0, 0, left, right, &result)
    var maxLength = Int.min
    for r in result {
        maxLength = max(maxLength, r.count)
    }
    var output: [String] = []
    for r in result {
        if r.count == maxLength {
            output.append(r)
        }
    }
    return output
}

func helper(_ s: [Character], _ index: Int, _ curr: String, _ open: Int, _ close: Int, _ left: Int, _ right: Int, _ result: inout Set<String>) {
    if index == s.count {
        if open == close {
            result.insert(curr)
        }
        return
    }
    let c = s[index]
    
    if c != "(" && c != ")" {
        helper(s, index + 1, curr + String(c), open, close, left, right, &result)
    } else {
        // Add to curr
        if c == "(" {
            if index < s.count - 1 {
                helper(s, index + 1, curr + "(", open + 1, close, left, right, &result)
            }
        } else { // it's a )
            if open > close {
                helper(s, index + 1, curr + ")", open, close + 1, left, right, &result)
            }
        }
        // Do not add to curr
        if c == "("  && left > 0 {
            helper(s, index + 1, curr, open, close, left - 1, right, &result)
        } else if c == ")" && right > 0 {
            helper(s, index + 1, curr, open, close, left, right - 1, &result)
        }
        
    }
}

let s = "()())()"
removeInvalidParentheses(s)

let s1 = "(a)())()"
removeInvalidParentheses(s1)

let s2 = ")("
removeInvalidParentheses(s2)

//let s3 = "((((((((((((((((((((aaaaa"
//removeInvalidParentheses(s3)
