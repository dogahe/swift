//
//  main.swift
//  DesignAddAndSearchWordsDataStructure
//
//  Created by Behzad Dogahe on 1/26/21.
//

/**
 211. Design Add and Search Words Data Structure
 Design a data structure that supports adding new words and finding if a string matches any previously added string.

 Implement the WordDictionary class:

 WordDictionary() Initializes the object.
 void addWord(word) Adds word to the data structure, it can be matched later.
 bool search(word) Returns true if there is any string in the data structure that matches word or false otherwise. word may contain dots '.' where dots can be matched with any letter.
  

 Example:

 Input
 ["WordDictionary","addWord","addWord","addWord","search","search","search","search"]
 [[],["bad"],["dad"],["mad"],["pad"],["bad"],[".ad"],["b.."]]
 Output
 [null,null,null,null,false,true,true,true]

 Explanation
 WordDictionary wordDictionary = new WordDictionary();
 wordDictionary.addWord("bad");
 wordDictionary.addWord("dad");
 wordDictionary.addWord("mad");
 wordDictionary.search("pad"); // return False
 wordDictionary.search("bad"); // return True
 wordDictionary.search(".ad"); // return True
 wordDictionary.search("b.."); // return True
  

 Constraints:

 1 <= word.length <= 500
 word in addWord consists lower-case English letters.
 word in search consist of  '.' or lower-case English letters.
 At most 50000 calls will be made to addWord and search.
 */

import Foundation

class WordDictionary {
    let size: Int = 26
    var children: [WordDictionary?] = Array(repeating: nil, count: 26)
    var isLeaf: Bool
    init() {
        isLeaf = false
        for i in 0 ..< size {
            children[i] = nil
        }
    }
    
    func addWord(_ word: String) {
        var curr: WordDictionary? = self
        for i in 0 ..< word.count {
            let index = word.index(word.startIndex, offsetBy: i)
            let char = word[index]
            let A: Character = "a"
            if let charVal = char.asciiValue, let aVal = A.asciiValue {
                let childIndex = Int(charVal - aVal)
                if curr?.children[childIndex] == nil {
                    curr?.children[childIndex] = WordDictionary()
                }
                curr = curr?.children[childIndex]
            }
        }
        curr?.isLeaf = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var curr: WordDictionary? = self
        for i in 0 ..< word.count {
            let index = word.index(word.startIndex, offsetBy: i)
            let char = word[index]
            if char == "." {
                for child in curr!.children {
                    let newWord = String(word.suffix(word.count - (i + 1)))
                    if child != nil && child!.search(newWord) {
                        return true
                    }
                }
                return false
            }
            let A: Character = "a"
            if let charVal = char.asciiValue, let aVal = A.asciiValue {
                let childIndex = Int(charVal - aVal)
                if curr?.children[childIndex] == nil {
                    return false
                }
                curr = curr?.children[childIndex]
            }
        }
        if let isLeaf = curr?.isLeaf {
            return isLeaf
        }
        return false
    }
}

let obj = WordDictionary()
obj.addWord("badass")
//obj.addWord("dad")
obj.addWord("mad")

print(obj.search("bada.s"))
print(obj.search("dad"))


