/*
 Spiral Matrix II
 
 Given a positive integer n, generate an n x n matrix filled with elements from 1 to n2 in spiral order.

 Example 1:

 Input: n = 3
 Output: [[1,2,3],[8,9,4],[7,6,5]]
 
 Example 2:

 Input: n = 1
 Output: [[1]]
  

 Constraints:

 1 <= n <= 20
 
 */

import Foundation

func generateMatrix(_ n: Int) -> [[Int]] {
    var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var minRow = 0
    var maxRow = n
    var minCol = -1
    var maxCol = n
    var dir = (0, 1)
    var row = 0
    var col = 0
    for num in 1 ... n*n {
        matrix[row][col] = num
        row += dir.0
        col += dir.1
        if dir == (0, 1) {
            if col == maxCol {
                row += 1
                col = maxCol - 1
                maxCol -= 1
                dir = (1, 0)
            }
        } else if dir == (1, 0) {
            if row == maxRow {
                row = maxRow - 1
                col -= 1
                maxRow -= 1
                dir = (0, -1)
            }
        } else if dir == (0, -1) {
            if col == minCol {
                row -= 1
                col = minCol +  1
                minCol += 1
                dir = (-1, 0)
            }
        } else if dir == (-1, 0) {
            if row == minRow {
                row = minRow + 1
                minRow += 1
                col += 1
                dir = (0, 1)
            }
        }
    }
    return matrix
}
generateMatrix(4)
