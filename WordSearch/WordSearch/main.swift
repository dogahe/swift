//
//  main.swift
//  WordSearch
//
//  Created by Behzad Dogahe on 4/19/21.
//
/*
 79. Word Search
 
 Given an m x n grid of characters board and a string word, return true if word exists in the grid.
 
 The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.
 
 Example 1:
 Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
 Output: true
 
 Example 2:
 Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
 Output: true
 
 Example 3:
 Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB"
 Output: false
 
 
 Constraints:
 
 m == board.length
 n = board[i].length
 1 <= m, n <= 6
 1 <= word.length <= 15
 board and word consists of only lowercase and uppercase English letters.
 
 
 Follow up: Could you use search pruning to make your solution faster with a larger board?
 
 */

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

let board: [[Character]] = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]//[["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
let word = "ABCCE"
print(exist(board, word))

