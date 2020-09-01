/*
 Rotting Oranges
 In a given grid, each cell can have one of three values:
 
 the value 0 representing an empty cell;
 the value 1 representing a fresh orange;
 the value 2 representing a rotten orange.
 Every minute, any fresh orange that is adjacent (4-directionally) to a rotten orange becomes rotten.
 
 Return the minimum number of minutes that must elapse until no cell has a fresh orange.  If this is impossible, return -1 instead.
 
 Example 1
 Input: [[2,1,1],[1,1,0],[0,1,1]]
 Output: 4
 
 Example 2
 Input: [[2,1,1],[0,1,1],[1,0,1]]
 Output: -1
 Explanation:  The orange in the bottom left corner (row 2, column 0) is never rotten, because rotting only happens 4-directionally.
 
 Example 3:
 Input: [[0,2]]
 Output: 0
 Explanation:  Since there are already no fresh oranges at minute 0, the answer is just 0.
 
 Note:
 
 1 <= grid.length <= 10
 1 <= grid[0].length <= 10
 grid[i][j] is only 0, 1, or 2.
 
 */

import Foundation

func orangesRotting(_ grid: [[Int]]) -> Int {
    
    func hasBad(_ grid: [[Int]], row: Int, col: Int) -> Bool {
        let rows = grid.count
        if rows > 0 {
            let cols = grid[0].count
            if row < rows - 1 {
                if grid[row + 1][col] == 2 {
                    return true
                }
            }
            if row > 0 {
                if grid[row - 1][col] == 2 {
                    return true
                }
            }
            if col < cols - 1 {
                if grid[row][col + 1] == 2 {
                    return true
                }
            }
            if col > 0 {
                if grid[row][col - 1] == 2 {
                    return true
                }
            }
        }
        return false
    }
    
    var gridCopy = grid
    let rows = gridCopy.count
    if rows > 0 {
        let cols = gridCopy[0].count
        var somethingChanged = true
        var time = 0
        while somethingChanged {
            time += 1
            somethingChanged = false
            for i in 0..<rows {
                for j in 0..<cols {
                    let val = gridCopy[i][j]
                    if val == 1 && hasBad(gridCopy, row: i, col: j) {
                        gridCopy[i][j] = 3
                        somethingChanged = true
                    }
                }
            }
            if somethingChanged {
                for i in 0..<rows {
                    for j in 0..<cols {
                        if gridCopy[i][j] == 3 {
                            gridCopy[i][j] = 2
                        }
                    }
                }
            } else {
                for i in 0..<rows {
                    for j in 0..<cols {
                        if gridCopy[i][j] == 1 {
                            return -1
                        }
                    }
                }
            }
        }
        return time - 1
    } else {
        return 0
    }
}

let a = [[2,1,1],[1,1,0],[0,1,1]]
//let a = [[2,1,1],[0,1,1],[1,0,1]]
orangesRotting(a)

