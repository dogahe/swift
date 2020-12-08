/*
 Two Sum
 
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 You can return the answer in any order.

  

 Example 1:

 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Output: Because nums[0] + nums[1] == 9, we return [0, 1].
 Example 2:

 Input: nums = [3,2,4], target = 6
 Output: [1,2]
 Example 3:

 Input: nums = [3,3], target = 6
 Output: [0,1]
  

 Constraints:

 2 <= nums.length <= 103
 -109 <= nums[i] <= 109
 -109 <= target <= 109
 Only one valid answer exists.
 
 
*/
import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for i in 0 ..< nums.count {
        let num1 = nums[i]
        for j in i+1 ..< nums.count {
            let num2 = nums[j]
            if num1 + num2 == target {
                return [i,j]
            }
        }
    }
    return [-1, -1]
}

func twoSumHash(_ nums: [Int], _ target: Int) -> [Int] {
    var dict: [Int:Int] = [:]
    for i in 0 ..< nums.count {
        let num1 = nums[i]
        if let val = dict[target - num1] {
            return [i, val]
        } else {
            dict[num1] = i
        }
    }
    return [-1, -1]
}

let nums = [3,2,4]
let target = 6

twoSum(nums, target)

twoSumHash(nums, target)
