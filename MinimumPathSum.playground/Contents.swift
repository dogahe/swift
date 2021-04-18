func minPathSum(_ grid: [[Int]]) -> Int {
    let m = grid.count
    let n = grid[0].count
    var sum: [[Int]] = Array(repeating: Array(repeating: -1, count: n), count: m)
    let result = helper(m - 1, n - 1, &sum, grid)
    return result
}

func helper(_ m: Int, _ n: Int, _ sum: inout [[Int]], _ grid: [[Int]]) -> Int {
    if m < 0 || n < 0 {
        return Int.max
    }
    
    if m == 0 && n == 0 {
        sum[m][n] = grid[m][n]
        return sum[m][n]
    }
    
    if sum[m][n] != -1 {
        return sum[m][n]
    }
    
    let last =  min(helper(m - 1, n, &sum, grid), helper(m, n - 1, &sum, grid))
    let result = grid[m][n] + last
    sum[m][n] = result
    return result
}

let grid = [[1,2,3],[4,5,6]]//[[1,3,1],[1,5,1],[4,2,1]]

let x = minPathSum(grid)
print(x)
