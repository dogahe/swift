import Foundation

func gameOfLife(_ board: inout [[Int]]) {
    var newBoard: [[Int]] = board
    let rows = board.count
    let cols = board[0].count
    print(rows, cols)
    for row in 0 ..< rows {
        for col in 0 ..< cols {
            print(row, col)
            let l = lives(board, row, col)
            
            if board[row][col] == 1 {
                if l < 2 {
                    newBoard[row][col] = 0
                } else if l < 4 {
                    newBoard[row][col] = 1
                } else {
                    newBoard[row][col] = 0
                }
            } else {
                if l == 3 {
                    newBoard[row][col] = 1
                }
            }
        }
    }
    board = newBoard
}

func lives(_ board: [[Int]], _ row: Int, _ col: Int) -> Int {
    let rows = board.count
    let cols = board[0].count
    let offsets = [[-1,-1], [-1,  0], [-1, 1],
                   [0, -1], [0, 1],
                   [1, -1], [1, 0], [1, 1]]
    var sum = 0
    for offset in offsets {
        let adRow = row + offset[0]
        let adCol = col + offset[1]
        if adRow >= 0 && adRow < rows && adCol >= 0 && adCol < cols {
            if board[adRow][adCol] == 1 {
                sum += 1
            }
        }
    }
    return sum
}

var board = [[1, 1], [1, 0]]//[[0,1,0],[0,0,1],[1,1,1],[0,0,0]]


gameOfLife(&board)
