/*
 
560. Subarray Sum Equals K
 
Given an array of integers nums and an integer k, return the total number of continuous subarrays whose sum equals to k.

 Example 1:

 Input: nums = [1,1,1], k = 2
 Output: 2
 Example 2:

 Input: nums = [1,2,3], k = 3
 Output: 2
  
 Constraints:

 1 <= nums.length <= 2 * 104
 -1000 <= nums[i] <= 1000
 -107 <= k <= 107
 
*/

func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var sum = 0
    var dict: [Int: Int] = [:]
    dict[0] = 1
    var output = 0
    for i in 0 ..< nums.count {
        sum += nums[i]
        if let val = dict[sum - k] {
            output += val
        }
        if let val = dict[sum] {
            dict[sum] = val + 1
        } else {
            dict[sum] = 1
        }

    }
    return output
}

let nums =
    [1,-1,0] //[1,2,3]//[1,1,1]
let k = 0

subarraySum(nums, k)
