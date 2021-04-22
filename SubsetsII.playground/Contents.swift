/*
 90. Subsets II
 
 Given an integer array nums that may contain duplicates, return all possible subsets (the power set).

 The solution set must not contain duplicate subsets. Return the solution in any order.

 Example 1:

 Input: nums = [1,2,2]
 Output: [[],[1],[1,2],[1,2,2],[2],[2,2]]
 Example 2:

 Input: nums = [0]
 Output: [[],[0]]
  
 Constraints:

 1 <= nums.length <= 10
 -10 <= nums[i] <= 10
 */

func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    var result: [[Int]] = []
    dfs(nums, &result, [])
    return result
}
func dfs(_ nums: [Int], _ result: inout [[Int]], _ subset: [Int]) {
    if nums.isEmpty {
        let s = subset.sorted()
        if !result.contains(s) {
            result.append(s)
        }
        return
    }
    dfs(nums.suffix(nums.count - 1), &result, subset)
    var newSubset = subset
    newSubset.append(nums[0])
    dfs(nums.suffix(nums.count - 1), &result, newSubset)
}

let nums = [1,2,2]
subsetsWithDup(nums)
