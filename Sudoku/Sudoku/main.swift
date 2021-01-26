//
//  main.swift
//  Sudoku
//
//  Created by Behzad Dogahe on 1/22/21.
//

import Foundation

func solveSudoku(_ board: inout [[Int]]) -> Bool {
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
            //printBoard(board)
            if solveSudoku(&board) {
                return true
            } else {
                board[row][col] = 0
            }
        }
    }
    return false
}

func solveAllSudoku(_ board: inout [[Int]], _ solutions: inout [[[Int]]]) -> Bool {
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
        //printBoard(board)
        solutions.append(board)
        return true
    }
    var result: Bool = false
    for num in 1 ... board.count {
        if isSafe(row, col, num, board) {
            board[row][col] = num
            printBoard(board)
            result = solveAllSudoku(&board, &solutions) || result
            board[row][col] = 0
        }
    }
    return result
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
    
func printBoard(_ board: [[Int]]) {
    var str: String = ""
    for x in 0 ..< board.count {
        for y in 0 ..< board.count {
            str += "\(board[x][y]) "
        }
        str += "\n"
    }
    print(str)
}

/*
var board: [[Int]] =  [
    [ 3, 0, 6, 5, 0, 8, 4, 0, 0 ],
    [ 5, 2, 0, 0, 0, 0, 0, 0, 0 ],
    [ 0, 8, 7, 0, 0, 0, 0, 3, 1 ],
    [ 0, 0, 3, 0, 1, 0, 0, 8, 0 ],
    [ 9, 0, 0, 8, 6, 3, 0, 0, 5 ],
    [ 0, 5, 0, 0, 9, 0, 6, 0, 0 ],
    [ 1, 3, 0, 0, 0, 0, 2, 5, 0 ],
    [ 0, 0, 0, 0, 0, 0, 0, 7, 4 ],
    [ 0, 0, 5, 2, 0, 6, 3, 0, 0 ]
]
*/


var board: [[Int]] =  [
    [ 0, 0, 5, 8, 0, 0, 9, 2, 0 ],
    [ 0, 0, 0, 0, 4, 9, 8, 5, 1 ],
    [ 0, 9, 1, 2, 0, 0, 0, 0, 3 ],
    [ 0, 0, 3, 4, 2, 0, 5, 6, 0 ],
    [ 0, 5, 4, 6, 0, 3, 0, 0, 0 ],
    [ 6, 8, 0, 9, 1, 5, 0, 4, 0 ],
    [ 4, 0, 0, 0, 3, 0, 6, 0, 0 ],
    [ 0, 0, 2, 5, 9, 0, 0, 0, 0 ],
    [ 0, 0, 8, 0, 6, 4, 0, 0, 9 ]
]


/*
if solveSudoku(&board) {
    printBoard(board)
} else {
    print("Solution does not exist")
}
*/

/*
var board: [[Int]] =  [
    [ 1, 0, 0, 0 ],
    [ 0, 0, 2, 0 ],
    [ 0, 3, 0, 0 ],
    [ 0, 0, 0, 0 ]
]
*/
var solutions: [[[Int]]] = []
if !solveAllSudoku(&board, &solutions) {
    print("There is no solution")
}
for solution in solutions {
    printBoard(solution)
}
