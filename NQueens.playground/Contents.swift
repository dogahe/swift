
func solveNQueens(_ n: Int) -> [[String]] {
    var board: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var solutions: [[[Int]]] = []
    if !solveAllNQueenUtil(0, &board, &solutions) {
        print("There is no solution")
    }
    let leet = convertToLeetCodeStyleAnswer(solutions)
    return leet
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

print(solveNQueens(4))
