//
//  main.swift
//  NQueen
//
//  Created by Behzad Dogahe on 1/21/21.
//

import Foundation

func solveNQueen(_ N: Int) {
    var board: [[Int]] = Array(repeating: Array(repeating: 0, count: N), count: N)
    var solutions: [[[Int]]] = []
    if !solveAllNQueenUtil(0, &board, &solutions) {
        print("There is no solution")
    }
    for solution in solutions {
        printBoard(solution)
    }
    
    let leet = convertToLeetCodeStyleAnswer(solutions)
    print(leet)
}

func solveNQueenUtil(_ row: Int, _ board: inout [[Int]]) -> Bool {
    if row == board.count {
        printBoard(board)
        return true
    }
    for col in 0 ..< board.count {
        if isSafe(row, col, board) {
            board[row][col] = 1
            if solveNQueenUtil(row + 1, &board) {
                return true
            } else {
                board[row][col] = 0
            }
        }
    }
    return false
}

func solveAllNQueenUtil(_ row: Int, _ board: inout [[Int]], _ solutions: inout [[[Int]]]) -> Bool {
    if row == board.count {
        solutions.append(board)
        return true
    }
    var result: Bool = false
    for col in 0 ..< board.count {
        if isSafe(row, col, board) {
            board[row][col] = 1
            result = solveAllNQueenUtil(row + 1, &board, &solutions) || result
            board[row][col] = 0
        }
    }
    return result
}

func isSafe(_ x: Int, _ y: Int, _ board: [[Int]]) -> Bool {
    // Need to make sure new queen places at (x, y) does not threaten previous queens
    for row in 0 ..< x {
        if let col = board[row].firstIndex(of: 1) {
            if y == col {
                return false
            }
            if abs(y - col) == abs(row - x) {
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

func convertToLeetCodeStyleAnswer(_ solutions: [[[Int]]]) -> [[String]] {
    var leetCodeSolutions: [[String]] = []
    for solution in solutions {
        var leetCodeSolution: [String] = []
        for row in 0 ..< solution.count {
            var str: String = ""
            for col in 0 ..< solution.count {
                if solution[row][col] == 0 {
                    str += "."
                } else {
                    str += "Q"
                }
            }
            leetCodeSolution.append(str)
        }
        leetCodeSolutions.append(leetCodeSolution)
    }
    return leetCodeSolutions
}

solveNQueen(4)

