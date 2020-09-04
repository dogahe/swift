/*
 Implement a routine that prints all possible orderings of the characters in a string. In other words, print all permutations that use all the characters from the original string. For example, given the string "hat", your function should print the strings "tha", "hat", "tah", "ath", "hta", and "hat". Treat each character in the input string as a distinct character, even if it is repeated. Given the string "aaa", your routine should print "aaa" six times. You may print the permutations in any order you choose.
 */

import Foundation

func permute(_ str: String) {
    let length = str.count
    var used: [Bool] = Array(repeating: false, count: length)
    var output: [Character] = []
    let input = Array(str)
    
    doPermute(input, output: &output, used: &used, length: length, level: 0)
}

func doPermute(_ input: [Character], output: inout [Character], used: inout [Bool], length: Int, level: Int) {
    if level == length {
        print(output)
        return
    }
    for i in 0..<length {
        if used[i] {
            continue
        }
        output.append(input[i])
        used[i] = true
        doPermute(input, output: &output, used: &used, length: length, level: level + 1)
        used[i] = false
        output = output.dropLast()
    }
}

permute("abc")
