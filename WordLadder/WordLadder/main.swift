//
//  main.swift
//  WordLadder
//
//  Created by Behzad Dogahe on 6/2/21.
//
/*

 127. Word Ladder
 
 A transformation sequence from word beginWord to word endWord using a dictionary wordList is a sequence of words beginWord -> s1 -> s2 -> ... -> sk such that:

 Every adjacent pair of words differs by a single letter.
 Every si for 1 <= i <= k is in wordList. Note that beginWord does not need to be in wordList.
 sk == endWord
 Given two words, beginWord and endWord, and a dictionary wordList, return the number of words in the shortest transformation sequence from beginWord to endWord, or 0 if no such sequence exists.

 Example 1:

 Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
 Output: 5
 Explanation: One shortest transformation sequence is "hit" -> "hot" -> "dot" -> "dog" -> cog", which is 5 words long.
 Example 2:

 Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log"]
 Output: 0
 Explanation: The endWord "cog" is not in wordList, therefore there is no valid transformation sequence.
  
 Constraints:

 1 <= beginWord.length <= 10
 endWord.length == beginWord.length
 1 <= wordList.length <= 5000
 wordList[i].length == beginWord.length
 beginWord, endWord, and wordList[i] consist of lowercase English letters.
 beginWord != endWord
 All the words in wordList are unique.
 
 https://www.geeksforgeeks.org/word-ladder-length-of-shortest-chain-to-reach-a-target-word/
 
 */

/*
func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
    var wordSet = Set<String>(wordList)
    if !wordSet.contains(endWord) {
        return 0
    }
    var queue: [String] = []
    queue.append(beginWord)
    var depth: Int = 0
    while !queue.isEmpty {
        depth += 1
        var levelSize = queue.count
        while levelSize > 0 {
            let curr = queue.removeLast()
            for i in 0 ..< curr.count {
                var temp = curr
                for charIndex in 0 ..< 26 {
                    let char = String(UnicodeScalar(Character("a").asciiValue! + UInt8(charIndex)))
                    if i == 0 {
                        temp = char + temp.suffix(temp.count - 1)
                    } else if i > 0 {
                        temp = temp.prefix(i) + char + temp.suffix(temp.count - 1 - i)
                    }
                    if curr == temp {
                        continue
                    } else if temp == endWord {
                        return depth + 1
                    } else if wordSet.contains(temp) {
                        queue.append(temp)
                        wordSet.remove(temp)
                    }
                    temp = curr
                }
            }
            levelSize -= 1
        }
    }
    return 0
}
*/

func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
    var wordSet = Set<String>(wordList)
    if !wordSet.contains(endWord) {
        return 0
    }
    var queue: [String] = []
    queue.append(beginWord)
    var level: Int = 0
    let wordLength = beginWord.count
    while !queue.isEmpty {
        level += 1
        let sizeOfQ = queue.count
        for _ in 0 ..< sizeOfQ {
            let word = queue.removeLast()
            for pos in 0 ..< wordLength {
                var temp = word
                for charIndex in 0 ..< 26 {
                    let char = String(UnicodeScalar(Character("a").asciiValue! + UInt8(charIndex)))
                    if pos == 0 {
                        temp = char + temp.suffix(wordLength - 1)
                    } else if pos > 0 {
                        temp = temp.prefix(pos) + char + temp.suffix(wordLength - 1 - pos)
                    }
                    if temp == word {
                        continue
                    } else if temp == endWord {
                        return level + 1
                    } else if wordSet.contains(temp) {
                        print(temp)
                        queue.append(temp)
                        wordSet.remove(temp)
                    }
                    temp = word
                }
            }
        }
    }
    return 0
}


let beginWord = "hit" //"toon"//"a" // "abcv" //,
let endWord = "cog" //"plea" //"c" // "ebad" // ,
let wordList = ["hot","dot","dog","lot","log","cog"] //["poon", "plee", "same", "poie", "plea", "plie", "poin"] //["a", "b", "c"] // ["abcd", "ebad", "ebcd", "xyza"]//


print(ladderLength(beginWord, endWord, wordList))