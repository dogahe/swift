/*

 3Sum
 
 Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

 Notice that the solution set must not contain duplicate triplets.

 Example 1:

 Input: nums = [-1,0,1,2,-1,-4]
 Output: [[-1,-1,2],[-1,0,1]]
 Example 2:

 Input: nums = []
 Output: []
 Example 3:

 Input: nums = [0]
 Output: []
  
 Constraints:

 0 <= nums.length <= 3000
 -105 <= nums[i] <= 105
 
*/
import Foundation

func threeSum(_ nums: [Int]) -> [[Int]] {
    var dict: [Int:[Int]] = [:]
    for i in 0 ..< nums.count {
        if let val = dict[nums[i]] {
            var newVal = val
            newVal.append(i)
            dict[nums[i]] = newVal
        } else {
            dict[nums[i]] = [i]
        }
    }
    var result: [[Int]] = []
    for i in 0 ..< nums.count {
        for j in i+1 ..< nums.count {
            let a = nums[i]
            let b = nums[j]
            if let val = dict[-a-b] {
                for index in val {
                    if index != i && index != j {
                        var triplet = [nums[i], nums[j], nums[index]]
                        triplet.sort()
                        if !result.contains(triplet) {
                            result.append(triplet)
                        }
                    }
                }
                
            }
        }
    }
    return result
}

let nums:[Int] = [0]//[-1,0,1,2,-1,-4]

threeSum(nums)
