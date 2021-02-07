/*
 
 40. Combination Sum II
 
 Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sum to target.

 Each number in candidates may only be used once in the combination.

 Note: The solution set must not contain duplicate combinations.

  

 Example 1:

 Input: candidates = [10,1,2,7,6,1,5], target = 8
 Output:
 [
 [1,1,6],
 [1,2,5],
 [1,7],
 [2,6]
 ]
 Example 2:

 Input: candidates = [2,5,2,1,2], target = 5
 Output:
 [
 [1,2,2],
 [5]
 ]
  

 Constraints:

 1 <= candidates.length <= 100
 1 <= candidates[i] <= 50
 1 <= target <= 30
 
 
 */
import Foundation

func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var result: [[Int]] = []
    dfs(candidates, [], 0, target, &result)
    return result
}

func dfs(_ candidates: [Int], _ curr: [Int], _ index: Int, _ target: Int,  _ result: inout [[Int]]) {
    if target == 0 {
        result.append(curr)
        return
    } else if target < 0 {
        return
    }
    for i in index ..< candidates.count {
        let candidate = candidates[i]
        if !curr.contains(candidate) {
            var newCurr = curr
            newCurr.append(candidate)
            var newCandidates = candidates
            newCandidates.remove(at: i)
            dfs(newCandidates, newCurr, i, target - candidate, &result)
        }
    }
}

let candidates = [10,1,2,7,6,1,5]
let target = 8

print(combinationSum2(candidates, target))
