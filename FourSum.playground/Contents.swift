/*
 18. 4Sum
 
 Given an array nums of n integers and an integer target, are there elements a, b, c, and d in nums such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.

 Notice that the solution set must not contain duplicate quadruplets.

  

 Example 1:

 Input: nums = [1,0,-1,0,-2,2], target = 0
 Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
 Example 2:

 Input: nums = [], target = 0
 Output: []
  

 Constraints:

 0 <= nums.length <= 200
 -109 <= nums[i] <= 109
 -109 <= target <= 109
 */

import Foundation

func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    if nums.count == 0  {
        return []
    }
    var dict: [Int:[[Int]]] =  [:]
    for i in 0 ..< nums.count - 1 {
        for j in i + 1 ..< nums.count {
            let sum = nums[i] + nums[j]
            if let val = dict[sum] {
                var newVal = val
                newVal.append([i, j])
                dict[sum] = newVal
            } else {
                dict[sum] = [[i, j]]
            }
        }
    }
    var values: Set<[Int]> = []
    for (key1, val1) in dict {
        let key2 = target - key1
        if let val2 = dict[key2] {
            for elem1 in val1 {
                for elem2 in val2 {
                    if Set(elem1).intersection(Set(elem2)).isEmpty {
                        var elem1New = elem1
                        elem1New.append(contentsOf: elem2)
                        var elem1Values = elem1New.map { nums[$0] }
                        elem1Values.sort()
                        values.insert(elem1Values)
                    }
                }
            }
        }
    }
    return Array(values)
}


let nums = [-2,-1,-1,1,1,2,2]
let target = 0

fourSum(nums, target)
