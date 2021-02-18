/*

 The K Weakest Rows in a Matrix
 
 Given a m * n matrix mat of ones (representing soldiers) and zeros (representing civilians), return the indexes of the k weakest rows in the matrix ordered from the weakest to the strongest.

 A row i is weaker than row j, if the number of soldiers in row i is less than the number of soldiers in row j, or they have the same number of soldiers but i is less than j. Soldiers are always stand in the frontier of a row, that is, always ones may appear first and then zeros.

  

 Example 1:
 
 Input: mat =
 [[1,1,0,0,0],
  [1,1,1,1,0],
  [1,0,0,0,0],
  [1,1,0,0,0],
  [1,1,1,1,1]],
 k = 3
 Output: [2,0,3]
 Explanation:
 The number of soldiers for each row is:
 row 0 -> 2
 row 1 -> 4
 row 2 -> 1
 row 3 -> 2
 row 4 -> 5
 Rows ordered from the weakest to the strongest are [2,0,3,1,4]
 Example 2:

 Input: mat =
 [[1,0,0,0],
  [1,1,1,1],
  [1,0,0,0],
  [1,0,0,0]],
 k = 2
 Output: [0,2]
 Explanation:
 The number of soldiers for each row is:
 row 0 -> 1
 row 1 -> 4
 row 2 -> 1
 row 3 -> 1
 Rows ordered from the weakest to the strongest are [0,2,3,1]
  

 Constraints:

 m == mat.length
 n == mat[i].length
 2 <= n, m <= 100
 1 <= k <= m
 matrix[i][j] is either 0 or 1.
 
*/
import Foundation

func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
    var soldiers: [(Int, Int)] = []
    for row in 0 ..< mat.count {
        var soldier: Int = 0
        for col in 0 ..< mat[row].count {
            if mat[row][col] == 1 {
                soldier += 1
            } else {
                break
            }
        }
        soldiers.append((row, soldier))
    }
    soldiers.sort { (a, b) -> Bool in
        let condition = a.1 < b.1 || (a.1 == b.1 && a.0 < b.0)
        return condition
    }
    return soldiers.prefix(k).map { $0.0 }
}

let mat =
    [[1,0,0,0],
     [1,1,1,1],
     [1,0,0,0],
     [1,0,0,0]]
let k = 2

kWeakestRows(mat, k)
