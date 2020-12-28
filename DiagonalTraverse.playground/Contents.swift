import Foundation

func findDiagonalOrder(_ matrix: [[Int]]) -> [Int] {
    let numRows = matrix.count
    if numRows == 0 {
        return []
    }
    let numCols = matrix[0].count
    var row = 0
    var col = 0
    var dir = [-1, 1]
    var elements = 0
    var output: [Int] = []
    while elements < numRows * numCols {
        output.append(matrix[row][col])
        row += dir[0]
        col += dir[1]
        if row == -1 && col < numCols {
            row = 0
            dir = [1 , -1]
        } else if col == -1 && row < numRows {
            col = 0
            dir = [-1, 1]
        } else if col >= numCols {
            col = numCols - 1
            row = row + 2
            dir = [1, -1]
        } else if row >= numRows {
            row = numRows - 1
            col = col + 2
            dir = [-1, 1]
        }
        elements += 1
    }
    return output
}

var input = [
    [ 1, 2, 3 ],
    [ 4, 5, 6 ],
    [ 7, 8, 9 ]
   ]

var in2:[[Int]] = []
findDiagonalOrder(in2)
