/*
 
 18.7 Given a list of words, write a program to find the longest word made of other words in the list.

 EXAMPLE

 Input: cat, banana, dog, nana, walk, walker, dogwalker Output: dogwalker

 pg 471
 
 */
import Foundation

func longestWords(_ arr: [String]) -> String {
    var dict: [String: Bool] = [:]
    for word in arr {
        dict[word] = true
    }
    let sortedArr = arr.sorted { $0.count > $1.count }
    for str in sortedArr {
        if canBuildWord(str, true, &dict) {
            return str
        }
    }
    return ""
}

func canBuildWord(_ str: String, _ isOriginalWord: Bool, _ dict: inout [String: Bool]) -> Bool {
    
    if let exist = dict[str], exist, !isOriginalWord {
        return exist
    }
    for i in 1 ..< str.count {
        let left: String = String(str.prefix(i))
        let right: String = String(str.suffix(str.count - i))
        if let leftWordExist = dict[left], leftWordExist, canBuildWord(right, false, &dict) {
            return true
        }
    }
    dict[str] = false
    return false
}


let words = ["cat", "banana", "catdognanawalk", "dog", "nana", "walk", "walker", "dogwalker"]

longestWords(words)
