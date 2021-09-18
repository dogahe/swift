/*
 
 tags:Google
 tags:Facebook
 
 Letter Combinations of a Phone Number
 
 Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

 A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
 
 Example 1:

 Input: digits = "23"
 Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
 Example 2:

 Input: digits = ""
 Output: []
 Example 3:

 Input: digits = "2"
 Output: ["a","b","c"]
  

 Constraints:

 0 <= digits.length <= 4
 digits[i] is a digit in the range ['2', '9'].
 
 */
import Foundation

func letterCombinations(_ digits: String) -> [String] {
    if digits == "" {
        return []
    }
    let digitsArr: [Character] = Array(digits)
    var output: [String] = []
    createWord(digitsArr, 0, "", &output)
    return output
}

func createWord(_ digits: [Character], _ level: Int, _ word: String, _ output: inout [String]) {
    if level == digits.count {
        output.append(word)
        return
    }
    let letters = getLetters(digits[level])
    for letter in letters {
        var updatedWord = word
        updatedWord.append(letter)
        createWord(digits, level + 1, updatedWord, &output)
    }
}

func getLetters(_ num: Character) -> [Character] {
    if num == "2" {
        return ["a", "b", "c"]
    } else if num == "3" {
        return ["d", "e", "f"]
    } else if num == "4" {
        return ["g", "h", "i"]
    } else if num == "5" {
        return ["j", "k", "l"]
    } else if num == "6" {
        return ["m", "n", "o"]
    } else if num == "7" {
        return ["p", "q", "r", "s"]
    } else if num == "8" {
        return ["t", "u", "v"]
    } else if num == "9" {
        return ["w", "x", "y", "z"]
    }
    return [num]
}

let digits = "952"

letterCombinations(digits)
