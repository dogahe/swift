//
//  main.swift
//  BalanceBrackets
//
//  Created by Behzad Dogahe on 5/10/21.
//

/*
 
 tags:Facebook
 
 Balance Brackets
 
 A bracket is any of the following characters: (, ), {, }, [, or ].
 We consider two brackets to be matching if the first bracket is an open-bracket, e.g., (, {, or [, and the second bracket is a close-bracket of the same type. That means ( and ), [ and ], and { and } are the only pairs of matching brackets.
 Furthermore, a sequence of brackets is said to be balanced if the following conditions are met:
 The sequence is empty, or
 The sequence is composed of two or more non-empty sequences, all of which are balanced, or
 The first and last brackets of the sequence are matching, and the portion of the sequence without the first and last elements is balanced.
 You are given a string of brackets. Your task is to determine whether each sequence of brackets is balanced. If a string is balanced, return true, otherwise, return false
 Signature
 bool isBalanced(String s)
 Input
 String s with length between 1 and 1000
 Output
 A boolean representing if the string is balanced or not
 
 Example 1
 s = {[()]}
 output: true
 
 Example 2
 s = {}()
 output: true
 
 Example 3
 s = {(})
 output: false
 
 Example 4
 s = )
 output: false
 
 
 */

func isBalanced(s: String) -> Bool {
    var stack: [Character] = []
    for i in 0 ..< s.count {
        let c = s[s.index(s.startIndex, offsetBy: i)]
        if c == "(" || c == "[" || c == "{" {
            stack.append(c)
        } else {
            if let last = stack.popLast() {
                if !((c == ")" && last == "(") || (c == "]" && last == "[") || (c == "}" && last == "{")) {
                    return false
                }
            } else {
                return false
            }
        }
    }
    return stack.isEmpty
}
// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom, but they are otherwise not editable!

var test_case_number = 1;
func check(expected: Bool, output: Bool) {
    let result = expected == output
    let rightTick = "\u{2713}"
    let wrongTick = "\u{2717}"
    if result {
        print("\(rightTick) Test #\(test_case_number)")
    } else {
        print("\(wrongTick) Test #\(test_case_number): Expected [\(expected)] Your output: [\(output)]")
    }
    test_case_number += 1
}

let s1 = "{[(])}"
check(expected: false, output: isBalanced(s: s1))

let s2 = "{{[[(())]]}}"
check(expected: true, output: isBalanced(s: s2))
