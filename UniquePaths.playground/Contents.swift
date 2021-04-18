/*
 62. Unique Paths
 
 A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

 The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

 How many possible unique paths are there?
 
 Input: m = 3, n = 7
 Output: 28
 
 Example 2:

 Input: m = 3, n = 2
 Output: 3
 Explanation:
 From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
 1. Right -> Down -> Down
 2. Down -> Down -> Right
 3. Down -> Right -> Down
 Example 3:

 Input: m = 7, n = 3
 Output: 28
 Example 4:

 Input: m = 3, n = 3
 Output: 6
 
 Constraints:

 1 <= m, n <= 100
 It's guaranteed that the answer will be less than or equal to 2 * 109.
 */


/* SLOW
func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var path: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
    path[0][0] = 1
    var paths: [[[Int]]] = []
    uniquePathsUtil(0, 0, m, n, &path, &paths)
    return paths.count
}

func uniquePathsUtil(_ x: Int, _ y: Int, _ m: Int, _ n: Int, _ path: inout [[Int]], _ paths: inout [[[Int]]]) {
    if x == m - 1 && y == n - 1 && path[x][y] == 1 {
        paths.append(path)
        return
    }
    let moves: [(Int, Int)] = [(1, 0), (0, 1)]
    for k in 0 ..< moves.count {
        let nextX = x + moves[k].0
        let nextY = y + moves[k].1
        if isPathSafe(nextX, nextY, m, n) {
            path[nextX][nextY] = 1
            uniquePathsUtil(nextX, nextY, m, n, &path, &paths)
        }
    }
    
}
*/

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var arr: [[Int]] = Array(repeating: Array(repeating: -1, count: n), count: m)
    let result = uniquePathsUtil(m - 1, n - 1, &arr)
    return result
}

func uniquePathsUtil(_ m: Int, _ n: Int, _ arr: inout [[Int]]) -> Int {
    if m == 0 || n == 0 {
        arr[m][n] = 1
        return 1
    }
    
    if arr[m][n] != -1 {
        return arr[m][n]
    }
    
    arr[m][n] = uniquePathsUtil(m, n - 1, &arr) + uniquePathsUtil(m - 1, n, &arr)
    
    return arr[m][n]
}

let pathsCount = uniquePaths(3, 2)
print(pathsCount)
