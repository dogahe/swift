/*
 
 37. Sudoku Solver
 
 Write a program to solve a Sudoku puzzle by filling the empty cells.

 A sudoku solution must satisfy all of the following rules:

 Each of the digits 1-9 must occur exactly once in each row.
 Each of the digits 1-9 must occur exactly once in each column.
 Each of the digits 1-9 must occur exactly once in each of the 9 3x3 sub-boxes of the grid.
 The '.' character indicates empty cells.
 
 Input: board = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
 Output: [["5","3","4","6","7","8","9","1","2"],["6","7","2","1","9","5","3","4","8"],["1","9","8","3","4","2","5","6","7"],["8","5","9","7","6","1","4","2","3"],["4","2","6","8","5","3","7","9","1"],["7","1","3","9","2","4","8","5","6"],["9","6","1","5","3","7","2","8","4"],["2","8","7","4","1","9","6","3","5"],["3","4","5","2","8","6","1","7","9"]]
 Explanation: The input board is shown above and the only valid solution is shown below:
 
 Constraints:

 board.length == 9
 board[i].length == 9
 board[i][j] is a digit or '.'.
 It is guaranteed that the input board has only one solution.
 
 
 */

import Foundation

func solveSudoku(_ board: inout [[Character]]) {
    var intBoard = convert(board)
    solveIntSudoku(&intBoard)
    board = convert(intBoard)
}

func convert(_ board: [[Character]]) -> [[Int]] {
    var newBoard: [[Int]] = Array(repeating: Array(repeating: 0, count: board.count), count: board.count)
    for row in 0 ..< board.count {
        for col in 0 ..< board.count {
            let element = board[row][col]
            if element.isNumber {
                if let num = element.wholeNumberValue {
                    newBoard[row][col] = num
                }
            } else {
                newBoard[row][col] = 0
            }
        }
    }
    return newBoard
}

func convert(_ board: [[Int]]) -> [[Character]] {
    var newBoard: [[Character]] = Array(repeating: Array(repeating: ".", count: board.count), count: board.count)
    for row in 0 ..< board.count {
        for col in 0 ..< board.count {
            let element = board[row][col]
            newBoard[row][col] = Character("\(element)")
        }
    }
    return newBoard
}

func solveIntSudoku(_ board: inout [[Int]]) -> Bool {
    var row = -1
    var col = -1
    for i in 0 ..< board.count {
        for j in 0 ..< board.count {
            if board[i][j] == 0 {
                row = i
                col = j
                break
            }
        }
    }
    if row == -1 && col == -1 {
        return true
    }
    for num in 1 ... board.count {
        if isSafe(row, col, num, board) {
            board[row][col] = num
            if solveIntSudoku(&board) {
                return true
            } else {
                board[row][col] = 0
            }
        }
    }
    return false
}

func isSafe(_ x: Int, _ y: Int, _ num: Int, _ board: [[Int]]) -> Bool {
    if board[x].contains(num) {
        return false
    }
    for row in 0 ..< board.count {
        let val = board[row][y]
        if val == num {
            return false
        }
    }
    
    let rank = Int(sqrt(Double(board.count)))
    
    let a = x/rank
    let b = y/rank
    for i in a*rank ..< a*rank + rank {
        for j in b*rank ..< b*rank + rank {
            if board[i][j] == num {
                return false
            }
        }
    }
    return true
}

var board: [[Character]] = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]


solveSudoku(&board)

print(board)
