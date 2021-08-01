/*
 
 tags:Google
 
 20. Valid Parentheses
 
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
  

 Example 1:

 Input: s = "()"
 Output: true
 Example 2:

 Input: s = "()[]{}"
 Output: true
 Example 3:

 Input: s = "(]"
 Output: false
 Example 4:

 Input: s = "([)]"
 Output: false
 Example 5:

 Input: s = "{[]}"
 Output: true
  
 Constraints:

 1 <= s.length <= 104
 s consists of parentheses only '()[]{}'.
 
 */
func isValid(_ s: String) -> Bool {
    var stack: [Character] = []
    for i in 0 ..< s.count {
        let c = s[s.index(s.startIndex, offsetBy: i)]
        if c == "(" || c == "[" || c == "{" {
            stack.append(c)
        } else {
            if let last = stack.last {
                if (c == ")" && last == "(") || (c == "]" && last == "[") || (c == "}" && last == "{") {
                    stack.removeLast()
                } else {
                    return false
                }
            } else {
                return false
            }
        }
    }
    return stack.isEmpty
}

let s = "{[]}"//"(]"//"()[]{}"//"()"
isValid(s)
