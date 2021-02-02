/*
 
 77. Combinations
 
 Given two integers n and k, return all possible combinations of k numbers out of 1 ... n.

 You may return the answer in any order.

  

 Example 1:

 Input: n = 4, k = 2
 Output:
 [
   [2,4],
   [3,4],
   [2,3],
   [1,2],
   [1,3],
   [1,4],
 ]
 Example 2:

 Input: n = 1, k = 1
 Output: [[1]]
  

 Constraints:

 1 <= n <= 20
 1 <= k <= n
 */

import Foundation

func combine(_ n: Int, _ k: Int) -> [[Int]] {
    var result: [[Int]] = []
    dfs(1, n, [], k, &result)
    return result
}

func dfs(_ min: Int, _ max: Int, _ combination: [Int], _ k: Int, _ result: inout [[Int]]) {
    if k == 0 {
        result.append(combination)
        return
    }
    if max < min {
        return
    }
    for i in min ... max {
        var newCombination = combination
        newCombination.append(i)
        dfs(i + 1, max, newCombination, k - 1, &result)
    }
}


let combinations = combine(5, 2)
print(combinations)

