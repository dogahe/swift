//
//  main.swift
//  LongestIncreasingPathInAMatrix
//
//  Created by Behzad Dogahe on 6/28/21.
//

/*
 
 tags:Google
 tags:Facebook
 
 329. Longest Increasing Path in a Matrix
 
 Given an m x n integers matrix, return the length of the longest increasing path in matrix.

 From each cell, you can either move in four directions: left, right, up, or down. You may not move diagonally or move outside the boundary (i.e., wrap-around is not allowed).
 
 Example 1:
 Input: matrix = [[9,9,4],[6,6,8],[2,1,1]]
 Output: 4
 Explanation: The longest increasing path is [1, 2, 6, 9].
 
 Example 2:
 Input: matrix = [[3,4,5],[3,2,6],[2,2,1]]
 Output: 4
 Explanation: The longest increasing path is [3, 4, 5, 6]. Moving diagonally is not allowed.
 
 Example 3:
 Input: matrix = [[1]]
 Output: 1
  
 Constraints:

 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 200
 0 <= matrix[i][j] <= 231 - 1
 
 */


// Solution One
/*
func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
    let rows = matrix.count
    let cols = matrix[0].count
    var adj: [[Int]] = Array(repeating: [], count: rows * cols)
    var k = 0
    let moves: [(Int, Int)] = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    for i in 0 ..< rows {
        for j in 0 ..< cols {
            for move in moves {
                let nextI = i + move.0
                let nextJ = j + move.1
                if nextI >= 0 && nextI < rows && nextJ >= 0 && nextJ < cols {
                    if matrix[nextI][nextJ] > matrix[i][j] {
                        adj[k].append(nextI*cols + nextJ)
                    }
                }
            }
            k += 1
        }
    }
    var visited: [Int] = Array(repeating: 0, count: adj.count)
    var maxVal: Int = 0
    for i in 0 ..< adj.count {
        if visited[i] == 0 {
            dfs(i, adj, &visited, &maxVal)
        }
    }
    return maxVal + 1
}

func dfs(_ node: Int, _ adj: [[Int]], _ visited: inout [Int], _ maxVal: inout Int) {
    for i in adj[node] {
        if visited[i] < visited[node] + 1 {
            visited[i] = visited[node] + 1
            maxVal = max(visited[i], maxVal)
            dfs(i, adj, &visited, &maxVal)
        }
    }
}
*/

// // Solution Two

func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
    let rows = matrix.count
    let cols = matrix[0].count
        
    var visited: [[Int]] = Array(repeating: Array(repeating: 0, count: cols), count: rows)
    var maxVal: Int = 0
    for i in 0 ..< rows {
        for j in 0 ..< cols {
            if visited[i][j] == 0 {
                dfs(matrix, i, j, &visited, &maxVal)
            }
        }
    }
    return maxVal + 1
}

func dfs(_ matrix: [[Int]], _ i: Int, _ j: Int, _ visited: inout [[Int]], _ maxVal: inout Int) {
    let rows = matrix.count
    let cols = matrix[0].count
    let moves: [(Int, Int)] = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    for move in moves {
        let nextI = i + move.0
        let nextJ = j + move.1
        if nextI >= 0 && nextI < rows && nextJ >= 0 && nextJ < cols && matrix[nextI][nextJ] > matrix[i][j]  {
            if visited[nextI][nextJ] < visited[i][j] + 1 {
                visited[nextI][nextJ] = visited[i][j] + 1
                maxVal = max(visited[nextI][nextJ], maxVal)
                dfs(matrix, nextI, nextJ, &visited, &maxVal)
            }
        }
    }
}


let matrix = [[3,4,5],[3,2,6],[2,2,1]]//[[1]]//[[9,9,4],[6,6,8],[2,1,1]]//
let path = longestIncreasingPath(matrix)
print(path)
