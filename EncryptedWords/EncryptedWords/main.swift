//
//  main.swift
//  EncryptedWords
//
//  Created by Behzad Dogahe on 5/10/21.
//
/*
 
 tags:Facebook
 
 Encrypted Words
 You've devised a simple encryption method for alphabetic strings that shuffles the characters in such a way that the resulting string is hard to quickly read, but is easy to convert back into the original string.
 When you encrypt a string S, you start with an initially-empty resulting string R and append characters to it as follows:
 *         Append the middle character of S (if S has even length, then we define the middle character as the left-most of the two central characters)
 *         Append the encrypted version of the substring of S that's to the left of the middle character (if non-empty)
 *         Append the encrypted version of the substring of S that's to the right of the middle character (if non-empty)
 For example, to encrypt the string "abc", we first take "b", and then append the encrypted version of "a" (which is just "a") and the encrypted version of "c" (which is just "c") to get "bac".
 If we encrypt "abcxcba" we'll get "xbacbca". That is, we take "x" and then append the encrypted version "abc" and then append the encrypted version of "cba".
 Input
 S contains only lower-case alphabetic characters
 1 <= |S| <= 10,000
 Output
 Return string R, the encrypted version of S.
 Example 1
 S = "abc"
 R = "bac"
 Example 2
 S = "abcd"
 R = "bacd"
 Example 3
 S = "abcxcba"
 R = "xbacbca"
 Example 4
 S = "facebook"
 R = "eafcobok"
 
 */
func findEncryptedWord(s: String) -> String {
    if s.count <= 1 {
        return s
    }
    let mid = (s.count - 1)/2
    let c = s[s.index(s.startIndex, offsetBy: mid)]
    var str: String = ""
    str.append(String(c))
    str.append(findEncryptedWord(s: String(s.prefix(mid))))
    str.append(findEncryptedWord(s: String(s.suffix(s.count - 1 - mid))))
    return str
}

// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom, but they are otherwise not editable!

var test_case_number = 1
func check(expected: String, output: String) {
    let result = expected == output
    let rightTick = "\u{2713}"
    let wrongTick = "\u{2717}"
    if result {
        print("\(rightTick) Test #\(test_case_number)")
    } else {
        print("\(wrongTick) Test # \(test_case_number): Expected \(expected) Your output: \(output)")
    }
    test_case_number += 1
}

let s1 = "abc"
let expected1 = "bac"
let output1 = findEncryptedWord(s: s1)
check(expected: expected1, output: output1)

let s2 = "abcd"
let expected2 = "bacd"
let output2 = findEncryptedWord(s: s2)
check(expected: expected2, output: output2)

// Add your own test cases here

