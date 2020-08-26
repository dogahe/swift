// Given a word, you need to judge whether the usage of capitals in it is right or not.
// We define the usage of capitals in a word to be right when one of the following cases holds
// 1. All letters in this word are capitals, like "USA"
// 2. All letters in this word are not capitals, like "cherry"
// 3. Only the first letter in this word is capitals, like "Hello"


import UIKit

var str = "Hello, Playground"

func detectCapitalUse(_ word: String) -> Bool {
    if word.count > 0 {
        if word == word.uppercased() {
            return true
        } else if word == word.lowercased() {
            return true
        } else {
            let firstLetter =  word.prefix(1)
            print(firstLetter)
            if firstLetter == firstLetter.lowercased() {
                return false
            }
            let remaining = word.suffix(word.count - 1)
            if remaining == remaining.lowercased() {
                return true
            }
            return false
        }
    } else {
        return true
    }
}

detectCapitalUse("USA")
