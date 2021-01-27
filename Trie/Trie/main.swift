//
//  main.swift
//  Trie
//
//  Created by Behzad Dogahe on 1/26/21.
//
/**
 208. Implement Trie (Prefix Tree)
 Implement a trie with insert, search, and startsWith methods.

 Example:

 Trie trie = new Trie();

 trie.insert("apple");
 trie.search("apple");   // returns true
 trie.search("app");     // returns false
 trie.startsWith("app"); // returns true
 trie.insert("app");
 trie.search("app");     // returns true
 Note:

 You may assume that all inputs are consist of lowercase letters a-z.
 All inputs are guaranteed to be non-empty strings.
 */

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
        var pChild: Trie? = self
        for i in 0 ..< word.count {
            let index = word.index(word.startIndex, offsetBy: i)
            let char = word[index]
            let A: Character = "a"
            if let charVal = char.asciiValue, let aVal = A.asciiValue {
                let childIndex = Int(charVal - aVal)
                if pChild?.children[childIndex] == nil {
                    pChild?.children[childIndex] = Trie()
                }
                pChild = pChild?.children[childIndex]
            }
        }
        pChild?.isLeaf = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var pChild: Trie? = self
        for i in 0 ..< word.count {
            let index = word.index(word.startIndex, offsetBy: i)
            let char = word[index]
            let A: Character = "a"
            if let charVal = char.asciiValue, let aVal = A.asciiValue {
                let childIndex = Int(charVal - aVal)
                if pChild?.children[childIndex] == nil {
                    return false
                }
                pChild = pChild?.children[childIndex]
            }
        }
        if let isLeaf = pChild?.isLeaf {
            return isLeaf
        }
        return false
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var pChild: Trie? = self
        for i in 0 ..< prefix.count {
            let index = prefix.index(prefix.startIndex, offsetBy: i)
            let char = prefix[index]
            let A: Character = "a"
            if let charVal = char.asciiValue, let aVal = A.asciiValue {
                let childIndex = Int(charVal - aVal)
                if pChild?.children[childIndex] == nil {
                    return false
                }
                pChild = pChild?.children[childIndex]
            }
        }
        return true
    }
}



let obj = Trie()
obj.insert("behzad")
obj.insert("beh")

let ret_2: Bool = obj.search("beh")
print(ret_2)
let ret_3: Bool = obj.startsWith("behf")
print(ret_3)



