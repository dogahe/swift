/*
Search a 2D Matrix

 Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:

 Integers in each row are sorted from left to right.
 The first integer of each row is greater than the last integer of the previous row.
  

 Example 1:
 Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,50]], target = 3
 Output: true
 
 Example 2:
 Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,50]], target = 13
 Output: false
 
 Example 3:
 Input: matrix = [], target = 0
 Output: false
 
 Constraints:

 m == matrix.length
 n == matrix[i].length
 0 <= m, n <= 100
 -104 <= matrix[i][j], target <= 104
 
 */
import Foundation

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    
    if matrix.count == 0 {
        return false
    }
    
    let m = matrix.count
    let n = matrix[0].count

    var minIndex = 0
    var maxIndex = m * n - 1
    
    while minIndex <= maxIndex
    {
        let midIndex = (minIndex + maxIndex) / 2
        let val = matrix[midIndex / n][midIndex % n]
        if target == val {
            return true
        } else if target < val {
            maxIndex = midIndex - 1
        } else {
            minIndex = midIndex + 1
        }
    }
    return false
}

let matrix: [[Int]] = [[1, 3, 4, 7]] //[[1,3,5,7],[10,11,16,20],[23,30,34,50]]
let target = 7

print(searchMatrix(matrix, target))

