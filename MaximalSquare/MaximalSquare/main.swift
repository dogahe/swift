//
//  main.swift
//  MaximalSquare
//
//  Created by Behzad Dogahe on 6/26/21.
//

/*
 221. Maximal Square
 
 Given an m x n binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.

 Example 1:
 Input: matrix = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
 Output: 4
 
 Example 2:
 Input: matrix = [["0","1"],["1","0"]]
 Output: 1
 
 Example 3:
 Input: matrix = [["0"]]
 Output: 0
  
 Constraints:

 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 300
 matrix[i][j] is '0' or '1'.

 */

func maximalSquare(_ matrix: [[Character]]) -> Int {
    let rows = matrix.count
    if rows == 0 {
        return 0
    }
    let cols = matrix[0].count
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: cols + 1), count: rows + 1)
    var maxSide = 0
    for row in 1 ..< dp.count {
        for col in 1 ..< dp[0].count {
            if matrix[row - 1][col - 1] == "1" {
                dp[row][col] = 1 + [dp[row - 1][col], dp[row][col - 1], dp[row - 1][col - 1]].min()!
                maxSide = max(maxSide, dp[row][col])
            }
        }
    }
    return maxSide*maxSide
}

let matrix: [[Character]] =  [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]] // [["0", "1"], ["1", "0"]] //

let area = maximalSquare(matrix)
print(area)
