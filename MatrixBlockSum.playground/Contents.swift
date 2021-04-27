/*
 1314. Matrix Block Sum
 
 Given a m x n matrix mat and an integer k, return a matrix answer where each answer[i][j] is the sum of all elements mat[r][c] for:

 i - k <= r <= i + k,
 j - k <= c <= j + k, and
 (r, c) is a valid position in the matrix.
  

 Example 1:

 Input: mat = [[1,2,3],[4,5,6],[7,8,9]], k = 1
 Output: [[12,21,16],[27,45,33],[24,39,28]]
 Example 2:

 Input: mat = [[1,2,3],[4,5,6],[7,8,9]], k = 2
 Output: [[45,45,45],[45,45,45],[45,45,45]]
  

 Constraints:

 m == mat.length
 n == mat[i].length
 1 <= m, n, k <= 100
 1 <= mat[i][j] <= 100
 
 
 */
func matrixBlockSum(_ mat: [[Int]], _ k: Int) -> [[Int]] {
    let m = mat.count
    let n = mat[0].count
    var matSum: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
    for row in 0 ..< m {
        for col in 0 ..< n {
            var sum = 0
            for r in row - k ... row + k {
                for c in col - k ... col + k {
                    if r >= 0 && r < m && c >= 0 && c < n {
                        sum += mat[r][c]
                    }
                }
            }
            matSum[row][col] = sum
        }
    }
    return matSum
}

let mat = [[1,2,3],[4,5,6],[7,8,9]]
let k = 2
matrixBlockSum(mat, k)

