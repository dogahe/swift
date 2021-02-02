//
//  main.swift
//  Boggle
//
//  Created by Behzad Dogahe on 1/28/21.
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
        var pChild: Trie? = self
        for i in 0 ..< word.count {
            let index = word.index(word.startIndex, offsetBy: i)
            let char = word[index]
            let A: Character = "A"
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

func isSafe(_ i: Int, _ j: Int, _ visited: [[Bool]]) -> Bool {
    return i >= 0 && i < visited.count && j >= 0 && j < visited[0].count && !visited[i][j]
}

// A recursive function to print
// all words present on boggle

func searchWord(_ root: Trie, _ boggle: [[Character]], _ i: Int, _ j: Int, _ visited: inout [[Bool]], _ str: String) {
    if root.isLeaf {
        print(str)
    }
    let movements: [(Int, Int)] = [(-1, -1), (-1, 0), (-1, 1), (0, 1), (0, -1), (1, 1), (1, 0), (1, -1)]
    if isSafe(i, j, visited) {
        visited[i][j] = true
        for k in 0 ..< 26 {
            if let child = root.children[k] {
                let A: Character = "A"
                if let aVal = A.asciiValue {
                    let char: Character = Character(UnicodeScalar(aVal + UInt8(k)))
                    for movement in movements {
                        let nextI = i + movement.0
                        let nextJ = j + movement.1
                        if isSafe(nextI, nextJ, visited) && boggle[nextI][nextJ] == char  {
                            searchWord(child, boggle, nextI, nextJ, &visited, str + String(char))
                        }
                    }
                }
            }
        }
        visited[i][j] = false
    }
}

func findWords(_ boggle: [[Character]], _ root: Trie) {
    
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: boggle[0].count), count: boggle.count)
    var curr: Trie? = root
    var str: String = ""
    
    for i in 0 ..< boggle.count {
        for j in 0 ..< boggle[0].count {
            // we start searching for word in dictionary
            // if we found a character which is child
            // of Trie root
            let char = boggle[i][j]
            let A: Character = "A"
            if let charVal = char.asciiValue, let aVal = A.asciiValue {
                let childIndex = Int(charVal - aVal)
                if let child = curr?.children[childIndex] {
                    str += String(char)
                    searchWord(child, boggle, i, j, &visited, str)
                }
                str = ""
            }
        }
    }
}



let dictionary: [String] =  ["TAB", "BAT", "BAIT", "GEEKS", "TRIE"]//["GEEKS", "FOR", "QUIZ", "GEE"]
let trie: Trie = Trie()

for word in dictionary {
    trie.insert(word)
}
/*
var boggle: [[Character]] = [ ["G", "I", "Z"],
                              ["U", "E", "K"],
                              ["Q", "S", "E"] ]
*/

var boggle: [[Character]] = [ ["U", "I", "A", "T"],
                              ["A", "B", "T", "D"],
                              ["S", "R", "R", "E"],
                              ["T", "E", "I", "K"]]

findWords(boggle, trie);


