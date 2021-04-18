/*
 Unique Paths II
 
 */

func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
    let m = obstacleGrid.count
    let n = obstacleGrid[0].count
    
    if obstacleGrid[0][0] == 1 {
        return 0
    }
    
    var arr: [[Int]] = Array(repeating: Array(repeating: -1, count: n), count: m)
    let result = uniquePathsUtil(m - 1, n - 1, &arr, obstacleGrid)
    return result
}

func uniquePathsUtil(_ m: Int, _ n: Int, _ arr: inout [[Int]], _ obstacleGrid: [[Int]]) -> Int {
    if obstacleGrid[m][n] == 1 {
        arr[m][n] = 0
        return 0
    }
    
    if arr[m][n] != -1 {
        return arr[m][n]
    }
    
    if m == 0 && n > 0 {
        arr[m][n] = uniquePathsUtil(m, n - 1, &arr, obstacleGrid)
        return arr[m][n]
    }
    
    if m > 0 && n == 0 {
        arr[m][n] = uniquePathsUtil(m - 1, n, &arr, obstacleGrid)
        return arr[m][n]
    }
    
    if m == 0 && n == 0 {
        arr[m][n] = 1
        return arr[m][n]
    }
    
    arr[m][n] = uniquePathsUtil(m, n - 1, &arr, obstacleGrid) + uniquePathsUtil(m - 1, n, &arr, obstacleGrid)
    return arr[m][n]
}

let obstacleGrid = [[0,0,0],[0,1,0],[0,0,0]]
uniquePathsWithObstacles(obstacleGrid)
