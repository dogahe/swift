/*
 
 tags:Facebook
 
 78. Subsets
 
 Given an integer array nums of unique elements, return all possible subsets (the power set).

 The solution set must not contain duplicate subsets. Return the solution in any order.

 Example 1:

 Input: nums = [1,2,3]
 Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
 Example 2:

 Input: nums = [0]
 Output: [[],[0]]
  
 Constraints:

 1 <= nums.length <= 10
 -10 <= nums[i] <= 10
 All the numbers of nums are unique.
 
 */

import Foundation

func subsets(_ nums: [Int]) -> [[Int]] {
    var result: [[Int]] = []
    dfs(nums, &result, [])
    return result
}

func dfs(_ nums: [Int], _ result: inout [[Int]], _ subset: [Int]) {
    if nums.isEmpty {
        result.append(subset)
        return
    }
    dfs(nums.suffix(nums.count - 1), &result, subset)
    var newSubset = subset
    newSubset.append(nums[0])
    dfs(nums.suffix(nums.count - 1), &result, newSubset)
}

let nums = [1,2,3]


let powerSet = subsets(nums)
print(powerSet)
