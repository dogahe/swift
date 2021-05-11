//
//  main.swift
//  BalanceBrackets
//
//  Created by Behzad Dogahe on 5/10/21.
//

func isBalanced(s: String) -> Bool {
    var stack: [Character] = []
    for i in 0 ..< s.count {
        let c = s[s.index(s.startIndex, offsetBy: i)]
        if c == "(" || c == "[" || c == "{" {
            stack.append(c)
        } else {
            if let last = stack.popLast() {
                if (c == ")" && last == "(") || (c == "]" && last == "[") || (c == "}" && last == "{") {
                    
                } else {
                    return false
                }
            } else {
                return false
            }
        }
    }
    if !stack.isEmpty {
        return false
    }
    return true
}


let s1 = "{[(])}"
let output1 = isBalanced(s: s1)
print(output1)

let s2 = "{{[[(())]]}}"
let output2 = isBalanced(s: s2)
print(output2)

let s3 = "{(})"
let output3 = isBalanced(s: s3)
print(output3)
