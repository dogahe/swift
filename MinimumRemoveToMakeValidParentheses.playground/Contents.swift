/*
 1249. Minimum Remove to Make Valid Parentheses
 
 Given a string s of '(' , ')' and lowercase English characters.

 Your task is to remove the minimum number of parentheses ( '(' or ')', in any positions ) so that the resulting parentheses string is valid and return any valid string.

 Formally, a parentheses string is valid if and only if:

 It is the empty string, contains only lowercase characters, or
 It can be written as AB (A concatenated with B), where A and B are valid strings, or
 It can be written as (A), where A is a valid string.
  

 Example 1:

 Input: s = "lee(t(c)o)de)"
 Output: "lee(t(c)o)de"
 Explanation: "lee(t(co)de)" , "lee(t(c)ode)" would also be accepted.
 Example 2:

 Input: s = "a)b(c)d"
 Output: "ab(c)d"
 Example 3:

 Input: s = "))(("
 Output: ""
 Explanation: An empty string is also valid.
 Example 4:

 Input: s = "(a(b(c)d)"
 Output: "a(b(c)d)"
  

 Constraints:

 1 <= s.length <= 10^5
 s[i] is one of  '(' , ')' and lowercase English letters.
 
 */

func minRemoveToMakeValid(_ s: String) -> String {
    var output: [Character] = []
    var j = 0
    var stack: [(Character, Int)] = []
    let arr = Array(s)
    for i in 0 ..< arr.count {
        let c = arr[i]
        if c == "(" || c == ")" {
            if c == "(" {
                stack.append(("(", j))
                output.append("(")
                j += 1
            } else {
                if let last = stack.last, last.0 == "(" {
                    stack.removeLast()
                    output.append(")")
                    j += 1
                }
            }
        } else {
            output.append(c)
            j += 1
        }
    }
    while !stack.isEmpty {
        let last = stack.removeLast()
        output.remove(at: last.1)
    }
    return String(output)
}

func minRemoveToMakeValidII(_ s: String) -> String {
    var str: [Character] = []
    var open = 0
    let arr = Array(s)
    for i in 0 ..< arr.count {
        let c = arr[i]
        if c == "(" {
            open += 1
        } else if c == ")" {
            if open == 0 {
                continue
            }
            open -= 1
        }
        str.append(c)
    }
    
    if open > 0 {
        var output: [Character] = []
        for i in 0 ..< str.count {
            let c = str[str.count - 1 - i]
            if c != "(" || open == 0 {
                output.append(c)
            } else {
                open -= 1
            }
        }
        return String(output.reversed())
    } else {
        return String(str)
    }
}

let s =  "lee(t(c)o)de)"//"())()((("//"(a(b(c)d)"//"))(("//"a)b(c)d"//"lee(t(c)o)de)"
minRemoveToMakeValid(s)
