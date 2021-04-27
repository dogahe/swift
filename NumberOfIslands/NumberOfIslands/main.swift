//
//  main.swift
//  NumberOfIslands
//
//  Created by Behzad Dogahe on 4/26/21.
//
/*

 200. Number of Islands
 
 Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.

 An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

 Example 1:

 Input: grid = [
   ["1","1","1","1","0"],
   ["1","1","0","1","0"],
   ["1","1","0","0","0"],
   ["0","0","0","0","0"]
 ]
 Output: 1
 Example 2:

 Input: grid = [
   ["1","1","0","0","0"],
   ["1","1","0","0","0"],
   ["0","0","1","0","0"],
   ["0","0","0","1","1"]
 ]
 Output: 3
  
 Constraints:

 m == grid.length
 n == grid[i].length
 1 <= m, n <= 300
 grid[i][j] is '0' or '1'.
 
*/

import Foundation

func numIslands(_ grid: [[Character]]) -> Int {
    let m = grid.count
    let n = grid[0].count
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: m)

    var count: Int = 0
    for row in 0 ..< m {
        for col in 0 ..< n {
            if grid[row][col] == "1" && !visited[row][col] {
                dfs(grid, row, col, &visited)
                count += 1
            }
        }
    }
    return count
}

func dfs(_ grid: [[Character]], _ row: Int, _ col: Int, _ visited: inout [[Bool]]) {
    let movements: [(Int, Int)] = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    visited[row][col] = true
    for move in movements {
        if isSafe(grid, row + move.0, col + move.1, visited) {
            dfs(grid, row + move.0, col + move.1, &visited)
        }
    }
}

func isSafe(_ grid: [[Character]], _ row: Int, _ col: Int, _ visited: [[Bool]]) -> Bool {
    return row >= 0 && row < grid.count && col >= 0 && col < grid[0].count && grid[row][col] == "1" && !visited[row][col]
    
}

let grid: [[Character]] = [
  ["1","1","0","0","1"],
  ["1","1","0","0","1"],
  ["0","1","1","0","0"],
  ["1","0","0","1","1"]
]

print(numIslands(grid))
