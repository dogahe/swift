//
//  main.swift
//  ImplementMagicDictionary
//
//  Created by Behzad Dogahe on 1/29/21.
//

import Foundation

class Trie {
    let size: Int = 26
    var children: [Trie?] = Array(repeating: nil, count: 26)
    var isLeaf: Bool
    init() {
        isLeaf = false
        for i in 0 ..< size {
            children[i] = nil
        }
    }
    
    func insert(_ word: String) {
        var curr: Trie? = self
        for i in 0 ..< word.count {
            let char = word[word.index(word.startIndex, offsetBy: i)]
            let A: Character = "a"
            if let charVal = char.asciiValue, let aVal = A.asciiValue {
                let childIndex = Int(charVal - aVal)
                if curr?.children[childIndex] == nil {
                    curr?.children[childIndex] = Trie()
                }
                curr = curr?.children[childIndex]
            }
        }
        curr?.isLeaf = true
    }
}

class MagicDictionary {
    
    var trie: Trie = Trie()
    init() {
        
    }
    
    func buildDict(_ dictionary: [String]) {
        for word in dictionary {
            trie.insert(word)
        }
    }
    
    func search(_ searchWord: String) -> Bool {
        return searchHelper(searchWord, 0, 0, trie)
    }
    
    func searchHelper(_ word: String, _ index: Int, _ mismatch: Int, _ node: Trie) -> Bool {
        if node.isLeaf {
            if index == word.count {
                return mismatch == 1
            } else {
                return false
            }
        }
        if index == word.count {
            return false
        }
        let char = word[word.index(word.startIndex, offsetBy: index)]
        let A: Character = "a"
        if let charVal = char.asciiValue, let aVal = A.asciiValue {
            let childIndex = Int(charVal - aVal)
            
            if node.children[childIndex] == nil {
                if mismatch > 0  {
                    return false
                } else {
                    for i in 0 ..< 26 {
                        if node.children[i] != nil && searchHelper(word, index + 1, mismatch + 1, node.children[i]!) {
                            return true
                        }
                    }
                    
                }
            } else {
                let result =  searchHelper(word, index + 1, mismatch, node.children[childIndex]!)
                if result == true {
                    return true
                }
                for i in 0 ..< 26 {
                    if i == childIndex {
                        continue
                    }
                    if node.children[i] != nil && searchHelper(word, index + 1, mismatch + 1, node.children[i]!) {
                        return true
                    }
                }
                //return searchHelper(word, index + 1, mismatch, node.children[childIndex]!)
            }
        }
        
        return false
    }
}


let dictionary = ["a", "abc"]//["hello","hallo","leetcode"]
let searchWord = "abb"
let obj = MagicDictionary()
obj.buildDict(dictionary)
print(obj.search(searchWord))


