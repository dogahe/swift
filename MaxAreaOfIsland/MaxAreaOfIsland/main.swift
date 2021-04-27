//
//  main.swift
//  MaxAreaOfIsland
//
//  Created by Behzad Dogahe on 4/26/21.
//

/*
695. Max Area of Island
 
 Given a non-empty 2D array grid of 0's and 1's, an island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.

 Find the maximum area of an island in the given 2D array. (If there is no island, the maximum area is 0.)

 Example 1:

 [[0,0,1,0,0,0,0,1,0,0,0,0,0],
  [0,0,0,0,0,0,0,1,1,1,0,0,0],
  [0,1,1,0,1,0,0,0,0,0,0,0,0],
  [0,1,0,0,1,1,0,0,1,0,1,0,0],
  [0,1,0,0,1,1,0,0,1,1,1,0,0],
  [0,0,0,0,0,0,0,0,0,0,1,0,0],
  [0,0,0,0,0,0,0,1,1,1,0,0,0],
  [0,0,0,0,0,0,0,1,1,0,0,0,0]]
 
 Given the above grid, return 6. Note the answer is not 11, because the island must be connected 4-directionally.
 Example 2:

 [[0,0,0,0,0,0,0,0]]
 Given the above grid, return 0.
 Note: The length of each dimension in the given grid does not exceed 50.
 
*/

import Foundation

func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
    let m = grid.count
    let n = grid[0].count
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: m)

    var areas: [Int] = []
    var count: Int = 0
    for row in 0 ..< m {
        for col in 0 ..< n {
            if grid[row][col] == 1 && !visited[row][col] {
                var area: Int = 0
                dfs(grid, row, col, &visited, &area)
                areas.append(area)
                count += 1
            }
        }
    }
    if let max = areas.max() {
        return max
    } else {
        return 0
    }
}

func dfs(_ grid: [[Int]], _ row: Int, _ col: Int, _ visited: inout [[Bool]], _ area: inout Int) {
    let movements: [(Int, Int)] = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    visited[row][col] = true
    area += 1
    for move in movements {
        if isSafe(grid, row + move.0, col + move.1, visited) {
            dfs(grid, row + move.0, col + move.1, &visited, &area)
        }
    }
}

func isSafe(_ grid: [[Int]], _ row: Int, _ col: Int, _ visited: [[Bool]]) -> Bool {
    return row >= 0 && row < grid.count && col >= 0 && col < grid[0].count && grid[row][col] == 1 && !visited[row][col]
}

let grid: [[Int]] = [[0,0,1,0,0,0,0,1,0,0,0,0,0],
                     [0,0,0,0,0,0,0,1,1,1,0,0,0],
                     [0,1,1,0,1,0,0,0,0,0,0,0,0],
                     [0,1,0,0,1,1,0,0,1,0,1,0,0],
                     [0,1,0,0,1,1,0,0,1,1,1,0,0],
                     [0,0,0,0,0,0,0,0,0,0,1,0,0],
                     [0,0,0,0,0,0,0,1,1,1,0,0,0],
                     [0,0,0,0,0,0,0,1,1,0,0,0,0]]

print(maxAreaOfIsland(grid))


