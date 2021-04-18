/*

 Spiral Matrix
 
 Given an m x n matrix, return all elements of the matrix in spiral order.

 Example 1:
 Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
 Output: [1,2,3,6,9,8,7,4,5]
 
 Example 2:
 Input: matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
 Output: [1,2,3,4,8,12,11,10,9,5,6,7]
 
 Constraints:
 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 10
 -100 <= matrix[i][j] <= 100

*/

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    let m = matrix.count
    let n = matrix[0].count
    var minRow = 1
    var maxRow = m - 1
    var minCol = 0
    var maxCol = n - 1
    var dir = (0, 1)
    var row = 0
    var col = -1
    var output: [Int] = []
    var moves = 0
    while moves < m*n {
        if dir == (0, 1) {
            if col == maxCol {
                maxCol -= 1
                dir = (1, 0)
            }
        } else if dir == (1, 0) {
            if row == maxRow {
                maxRow -= 1
                dir = (0, -1)
            }
        } else if dir == (0, -1) {
            if col == minCol {
                minCol += 1
                dir = (-1, 0)
            }
        } else if dir == (-1, 0) {
            if row == minRow {
                minRow += 1
                dir = (0, 1)
            }
        }
        row += dir.0
        col += dir.1
        output.append(matrix[row][col])
        moves += 1
    }
    return output
}
//let matrix1 = [[1,2,3],[4,5,6],[7,8,9]]
let matrix1 = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
let spiral = spiralOrder(matrix1)
print(spiral)

