//
//  main.swift
//  IslandPerimeter
//
//  Created by Behzad Dogahe on 4/27/21.
//

func islandPerimeter(_ grid: [[Int]]) -> Int {
    let m = grid.count
    let n = grid[0].count
    var total = 0
    for r in 0 ..< m {
        for c in 0 ..< n {
            if grid[r][c] == 1 {
                let p = perimeter(grid, r, c)
                total += p
            }
        }
    }
    return total
}

func perimeter(_ grid: [[Int]], _ r: Int, _ c: Int) -> Int {
    let movements = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    var perimeter = 4
    for move in movements {
        let nextr = r + move.0
        let nextc = c + move.1
        
        if nextr >= 0 && nextr < grid.count && nextc >= 0 && nextc < grid[0].count {
            if grid[nextr][nextc] == 1 {
                perimeter -= 1
            }
        }
    }
    return perimeter
}

let grid = [[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]

print(islandPerimeter(grid))
