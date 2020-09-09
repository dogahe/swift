/*
 Implement a function that prints all possible combinations of the characters in a string. These combinations range in length from one to the length of the string. Two combinations that differ only in ordering of their characters are the same combination. In other words, "12" and "31" are different combinations from the input string "123", but "21" is the same as "12".
 */

import Foundation

func combine(_ str: String) {
    let length = str.count
    var output: [Character] = []
    let input = Array(str)
    
    doCombine(input, output: &output, length: length, level: 0, start: 0)
}

func doCombine(_ input: [Character], output: inout [Character], length: Int, level: Int, start: Int) {
    for i in start..<length {
        output.append(input[i])
        print(output)
        if i < length - 1 {
            doCombine(input, output: &output, length: length, level: level + 1, start: i + 1)
        }
        output = output.dropLast()
    }
}

combine("wxyz")
