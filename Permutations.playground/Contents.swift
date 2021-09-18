/*
 
 tags:Facebook
 
 46. Permutations
 
 Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.
 
 Example 1:

 Input: nums = [1,2,3]
 Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
 Example 2:

 Input: nums = [0,1]
 Output: [[0,1],[1,0]]
 Example 3:

 Input: nums = [1]
 Output: [[1]]
  

 Constraints:

 1 <= nums.length <= 6
 -10 <= nums[i] <= 10
 All the integers of nums are unique.
 */
import Foundation

func permute(_ nums: [Int]) -> [[Int]] {
    var result: [[Int]] = []
    dfs(nums, [], &result)
    return result
}

func dfs(_ nums: [Int], _ permutation: [Int], _ result: inout [[Int]]) {
    if nums.isEmpty {
        result.append(permutation)
        return
    }
    for i in 0 ..< nums.count {
        var newNums = nums
        let num = newNums.remove(at: i)
        var newPermutation = permutation
        newPermutation.append(num)
        dfs(newNums, newPermutation, &result)
    }
}

let nums = [1,2,3]
let permutes = permute(nums)
print(permutes)

