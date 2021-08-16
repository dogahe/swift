/*
 
 304. Range Sum Query 2D - Immutable
 
 Given a 2D matrix matrix, handle multiple queries of the following type:

 Calculate the sum of the elements of matrix inside the rectangle defined by its upper left corner (row1, col1) and lower right corner (row2, col2).
 Implement the NumMatrix class:

 NumMatrix(int[][] matrix) Initializes the object with the integer matrix matrix.
 int sumRegion(int row1, int col1, int row2, int col2) Returns the sum of the elements of matrix inside the rectangle defined by its upper left corner (row1, col1) and lower right corner (row2, col2).
  

 Example 1:
 Input
 ["NumMatrix", "sumRegion", "sumRegion", "sumRegion"]
 [[[[3, 0, 1, 4, 2], [5, 6, 3, 2, 1], [1, 2, 0, 1, 5], [4, 1, 0, 1, 7], [1, 0, 3, 0, 5]]], [2, 1, 4, 3], [1, 1, 2, 2], [1, 2, 2, 4]]
 Output
 [null, 8, 11, 12]

 Explanation
 NumMatrix numMatrix = new NumMatrix([[3, 0, 1, 4, 2], [5, 6, 3, 2, 1], [1, 2, 0, 1, 5], [4, 1, 0, 1, 7], [1, 0, 3, 0, 5]]);
 numMatrix.sumRegion(2, 1, 4, 3); // return 8 (i.e sum of the red rectangle)
 numMatrix.sumRegion(1, 1, 2, 2); // return 11 (i.e sum of the green rectangle)
 numMatrix.sumRegion(1, 2, 2, 4); // return 12 (i.e sum of the blue rectangle)
  

 Constraints:
 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 200
 -105 <= matrix[i][j] <= 105
 0 <= row1 <= row2 < m
 0 <= col1 <= col2 < n
 At most 104 calls will be made to sumRegion.
 
 */
class NumMatrix {

    var matrix: [[Int]]
    var cum: [[Int]]
    init(_ matrix: [[Int]]) {
        self.matrix = matrix
        let m = matrix.count
        let n = matrix[0].count
        cum = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        for i in 0 ..< m {
            for j in 0 ..< n {
                cum[i + 1][j + 1] = cum[i][j + 1] + cum[i + 1][j] - cum[i][j] + matrix[i][j]
            }
        }
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        return cum[row2 + 1][col2 + 1] - cum[row2 + 1][col1] - cum[row1][col2 + 1] + cum[row1][col1]
    }
}

let nm = NumMatrix([[3, 0, 1, 4, 2], [5, 6, 3, 2, 1], [1, 2, 0, 1, 5], [4, 1, 0, 1, 7], [1, 0, 3, 0, 5]])
nm.sumRegion(2, 1, 4, 3)
nm.sumRegion(1, 1, 2, 2)
nm.sumRegion(1, 2, 2, 4)
