/*

 Combination Sum
 
 Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order.

 The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the frequency of at least one of the chosen numbers is different.

 It is guaranteed that the number of unique combinations that sum up to target is less than 150 combinations for the given input.
 
 Example 1:

 Input: candidates = [2,3,6,7], target = 7
 Output: [[2,2,3],[7]]
 Explanation:
 2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
 7 is a candidate, and 7 = 7.
 These are the only two combinations.
 Example 2:

 Input: candidates = [2,3,5], target = 8
 Output: [[2,2,2,2],[2,3,3],[3,5]]
 Example 3:

 Input: candidates = [2], target = 1
 Output: []
 Example 4:

 Input: candidates = [1], target = 1
 Output: [[1]]
 Example 5:

 Input: candidates = [1], target = 2
 Output: [[1,1]]
  

 Constraints:

 1 <= candidates.length <= 30
 1 <= candidates[i] <= 200
 All elements of candidates are distinct.
 1 <= target <= 500
*/



import Foundation

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var results: [[Int]] = []
    var soFar: [Int] = []
    doesAddUp(&soFar , target, candidates, 0, &results)
    return results
}

func doesAddUp(_ soFar: inout [Int], _ target: Int, _ candidates: [Int], _ startIndex: Int, _
    results: inout [[Int]]) {
    let sum = soFar.reduce(0, +)
    if sum == target {
        results.append(soFar)
    } else {
        for index in startIndex ..< candidates.count {
            let candidate = candidates[index]
            if candidate > target - sum {
                continue
            }
            soFar.append(candidate)
            doesAddUp(&soFar, target, candidates, index, &results)
            soFar = soFar.dropLast()
        }
    }
}

func combinationSumDFS(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var result: [[Int]] = []
    dfs(candidates, [], 0, target, &result)
    return result
}

func dfs(_ candidates: [Int], _ curr: [Int], _ index: Int, _ target: Int, _ result: inout [[Int]]) {
    if target == 0 {
        result.append(curr)
        return
    } else if target < 0 {
        return
    }
    for i in index ..< candidates.count {
        let candidate = candidates[i]
        var newCurr = curr
        newCurr.append(candidate)
        dfs(candidates, newCurr, i, target - candidate, &result)
    }
}

let candidates = [2,3,5]
let target = 8

print(combinationSum(candidates, target))

print(combinationSumDFS(candidates, target))

