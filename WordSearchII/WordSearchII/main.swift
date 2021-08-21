//
//  main.swift
//  WordSearchII
//
//  Created by Behzad Dogahe on 8/20/21.
//

import Foundation

func exist(_ board: [[Character]], _ word: String) -> Bool {
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
    let wordChar = word[word.index(word.startIndex, offsetBy: 0)]
    for i in 0 ..< board.count {
        for j in 0 ..< board[0].count {
            if board[i][j] == wordChar {
                let result = searchWord(String(word.suffix(word.count - 1)), board, i, j, &visited)
                if result {
                    return result
                }
            }
            
        }
    }
    return false
}

func isSafe(_ i: Int, _ j: Int, _ visited: [[Bool]]) -> Bool {
    return i >= 0 && i < visited.count && j >= 0 && j < visited[0].count && !visited[i][j]
}

func searchWord(_ word: String, _ board: [[Character]], _ i: Int, _ j: Int, _ visited: inout [[Bool]]) -> Bool {
    if word.isEmpty {
        return true
    }
    
    let movements: [(Int, Int)] = [(-1, 0), (0, 1), (0, -1), (1, 0)]
    visited[i][j] = true
    let wordChar = word[word.index(word.startIndex, offsetBy: 0)]
    for movement in movements {
        let nextI = i + movement.0
        let nextJ = j + movement.1
        if isSafe(nextI, nextJ, visited) && board[nextI][nextJ] == wordChar  {
            let result = searchWord(String(word.suffix(word.count - 1)), board, nextI, nextJ, &visited)
            if result {
                return result
            }
        }
    }
    visited[i][j] = false
    return false
}

func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
    var output: [String] = []
    for word in words {
        if exist(board, word) {
            output.append(word)
        }
    }
    return output
}

let board2: [[Character]] = [["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]]
let words2 = ["oath","pea","eat","rain"]
print(findWords(board2, words2))

