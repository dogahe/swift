/*
 
 tags:Facebook
 
 32. Longest Valid Parentheses
 
 Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.

 Example 1:
 Input: s = "(()"
 Output: 2
 Explanation: The longest valid parentheses substring is "()".
 
 Example 2:
 Input: s = ")()())"
 Output: 4
 Explanation: The longest valid parentheses substring is "()()".
 
 Example 3:\
 Input: s = ""
 Output: 0
  
 Constraints:
 0 <= s.length <= 3 * 104
 s[i] is '(', or ')'.
 
 Solution:
 
 Instead of finding every possible string and checking its validity, we can make use of stack while scanning the given string to check if the string scanned so far is valid, and also the length of the longest valid string. In order to do so, we start by pushing −1 onto the stack.

 For every ‘(’ encountered, we push its index onto the stack.

 For every ‘)’ encountered, we pop the topmost element and subtract the current element's index from the top element of the stack, which gives the length of the currently encountered valid string of parentheses. If while popping the element, the stack becomes empty, we push the current element's index onto the stack. In this way, we keep on calculating the lengths of the valid substrings, and return the length of the longest valid string at the end.
 
 */

func longestValidParentheses(_ s: String) -> Int {
    var stack: [Int] = [-1]
    let sArr: [Character] = Array(s)
    var maxLength: Int = 0
    for i in 0 ..< sArr.count {
        if sArr[i] == "(" {
            stack.append(i)
        } else {
            stack.removeLast()
            if stack.isEmpty {
                stack.append(i)
            } else {
                maxLength = max(maxLength, i - stack.last!)
            }
        }
    }
    return maxLength
}

let s = "(()"
longestValidParentheses(s)

let s2 = ")()())"
longestValidParentheses(s2)

let s3 = ""
longestValidParentheses(s3)

let s4 = "())((())"
longestValidParentheses(s4)
