/*
 House Robber II
 
 You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed. All houses at this place are arranged in a circle. That means the first house is the neighbor of the last one. Meanwhile, adjacent houses have a security system connected, and it will automatically contact the police if two adjacent houses were broken into on the same night.

 Given a list of non-negative integers nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.
  
 Example 1:

 Input: nums = [2,3,2]
 Output: 3
 Explanation: You cannot rob house 1 (money = 2) and then rob house 3 (money = 2), because they are adjacent houses.
 Example 2:

 Input: nums = [1,2,3,1]
 Output: 4
 Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
 Total amount you can rob = 1 + 3 = 4.
 Example 3:

 Input: nums = [0]
 Output: 0
 
 Constraints:

 1 <= nums.length <= 100
 0 <= nums[i] <= 1000
 
 */

import Foundation

func rob(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    } else if nums.count == 1 {
        return nums[0]
    }
    
    var house: [Int] = []
    
    house.append(nums[0])
    house.append(max(house[0], nums[1]))
    for i in 2 ..< nums.count {
        house.append(max(house[i - 1], nums[i] + house[i - 2]))
    }
    return house.last!
}

func robCircle(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    } else if nums.count == 1 {
        return nums[0]
    }
    return max(rob(Array(nums.suffix(from: 1))), rob(Array(nums.prefix(nums.count - 1))))
}

//let nums = [0]
//let nums = [1,2,3,1]
let nums = [226,174,214,16,218,48,153,131,128,17,157,142,88,43,37,157,43,221,191,68,206,23,225,82,54,118,111,46,80,49,245,63,25,194,72,80,143,55,209,18,55,122,65,66,177,101,63,201,172,130,103,225,142,46,86,185,62,138,212,192,125,77,223,188,99,228,90,25,193,211,84,239,119,234,85,83,123,120,131,203,219,10,82,35,120,180,249,106,37,169,225,54,103,55,166,124]

print(robCircle(nums))
