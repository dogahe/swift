//
//  main.swift
//  CherryPickup
//
//  Created by Behzad Dogahe on 7/27/21.
//

func cherryPickup(_ grid: [[Int]]) -> Int {
    var g = grid
    let rows = grid.count
    let cols = grid[0].count
    var dpCache: [[[Int]]] =
        Array(repeating: Array(repeating: Array(repeating: Int.min, count: 2), count: cols), count: rows)
    return dp(0, 0, &g, &dpCache, 0)
}

func dp(_ row: Int, _ col: Int, _ grid: inout [[Int]], _ dpCache: inout [[[Int]]], _ dir: Int) -> Int {
    print(row, col, dir)
    let rows = grid.count
    let cols = grid[0].count
    if row < 0 || col < 0 || row >= rows || col >= cols || grid[row][col] == -1 {
        return Int.min
    }
    if dpCache[row][col][dir] != Int.min {
        return dpCache[row][col][dir]
    }
    var result = 0
    if grid[row][col] == 1 {
        result += 1
        grid[row][col] = 0
    }
    if dir == 0 {
        var a = 0
        var b = 0
        if row + 1 >= rows && col + 1 >= cols {
            a = dp(rows - 1, cols - 1, &grid, &dpCache, 1)
            b = 0
        } else {
            if col + 1 < cols, grid[row][col + 1] != -1 {
                a = dp(row, col + 1, &grid, &dpCache, 0)
            }
            if row + 1 < rows, grid[row + 1][col] != -1 {
                b = dp(row + 1, col, &grid, &dpCache, dir)
            }
        }
        result += max(a, b)
    } else {
        if row == 0 && col == 0 {
            return result
        }
        var a = 0
        var b = 0
        if col - 1 >= 0, grid[row][col - 1] != -1 {
            a = dp(row, col - 1, &grid, &dpCache, 1)
        }
        if row - 1 >= 0, grid[row - 1][col] != -1 {
            b = dp(row - 1, col, &grid, &dpCache, 1)
        }
        result += max(a, b)
    }
    dpCache[row][col][dir] = result
    return result
}

//let grid = [[0,1,-1],[1,0,-1],[1,1,1]]
//print(cherryPickup(grid))

let grid2 = [[1,1,-1],[1,-1,1],[-1,1,1]]
print(cherryPickup(grid2))
