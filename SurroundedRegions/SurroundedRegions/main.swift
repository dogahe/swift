//
//  main.swift
//  SurroundedRegions
//
//  Created by Behzad Dogahe on 4/27/21.
//

/*
130. Surrounded Regions
 
 Given an m x n matrix board containing 'X' and 'O', capture all regions surrounded by 'X'.

 A region is captured by flipping all 'O's into 'X's in that surrounded region.
 
 Example 1:
 
 Input: board = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
 Output: [["X","X","X","X"],["X","X","X","X"],["X","X","X","X"],["X","O","X","X"]]
 Explanation: Surrounded regions should not be on the border, which means that any 'O' on the border of the board are not flipped to 'X'. Any 'O' that is not on the border and it is not connected to an 'O' on the border will be flipped to 'X'. Two cells are connected if they are adjacent cells connected horizontally or vertically.
 
 Example 2:

 Input: board = [["X"]]
 Output: [["X"]]
  
 Constraints:

 m == board.length
 n == board[i].length
 1 <= m, n <= 200
 board[i][j] is 'X' or 'O'.
 
*/
func solve(_ board: inout [[Character]]) {
    let m = board.count
    let n = board[0].count
    for r in 0 ..< m  {
        for c in 0 ..< n  {
            if board[r][c] == "O" {
                board[r][c] = "T"
            }
        }
    }
    for r in 0 ..< m  {
        for c in [0, n - 1] {
            if board[r][c] == "T" {
                floodFill(&board, r, c, "O")
            }
        }
    }
    for c in 0 ..< n  {
        for r in [0, m - 1] {
            if board[r][c] == "T" {
                floodFill(&board, r, c, "O")
            }
        }
    }
    
    for r in 0 ..< m  {
        for c in 0 ..< n  {
            if board[r][c] == "T" {
                board[r][c] = "X"
            }
        }
    }
}

func floodFill(_ board: inout [[Character]], _ sr: Int, _ sc: Int, _ newChar: Character) {
    let m = board.count
    let n = board[0].count
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: m)
    let oldChar = board[sr][sc]
    dfs(&board, sr, sc, &visited, oldChar, newChar)
}

func dfs(_ output: inout [[Character]], _ row: Int, _ col: Int, _ visited: inout [[Bool]], _ oldChar: Character, _ newChar: Character) {
    let movements: [(Int, Int)] = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    visited[row][col] = true
    output[row][col] = newChar
    for move in movements {
        if isSafe(output, row + move.0, col + move.1, visited, oldChar) {
            dfs(&output, row + move.0, col + move.1, &visited, oldChar, newChar)
        }
    }
}

func isSafe(_ grid: [[Character]], _ row: Int, _ col: Int, _ visited: [[Bool]], _ oldColor: Character) -> Bool {
    return row >= 0 && row < grid.count && col >= 0 && col < grid[0].count && grid[row][col] == oldColor && !visited[row][col]
}

var board: [[Character]] = [["X"]] //[["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]

solve(&board)

print(board)

