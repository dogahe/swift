/*
 
 tags:Facebook
 
 523. Continuous Subarray Sum
 
 Given an integer array nums and an integer k, return true if nums has a continuous subarray of size at least two whose elements sum up to a multiple of k, or false otherwise.

 An integer x is a multiple of k if there exists an integer n such that x = n * k. 0 is always a multiple of k.

 Example 1:

 Input: nums = [23,2,4,6,7], k = 6
 Output: true
 Explanation: [2, 4] is a continuous subarray of size 2 whose elements sum up to 6.
 Example 2:

 Input: nums = [23,2,6,4,7], k = 6
 Output: true
 Explanation: [23, 2, 6, 4, 7] is an continuous subarray of size 5 whose elements sum up to 42.
 42 is a multiple of 6 because 42 = 7 * 6 and 7 is an integer.
 Example 3:

 Input: nums = [23,2,6,4,7], k = 13
 Output: false
  
 Constraints:

 1 <= nums.length <= 105
 0 <= nums[i] <= 109
 0 <= sum(nums[i]) <= 231 - 1
 1 <= k <= 231 - 1
 
 */

// Slow
/*
func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
    for i in 0 ..< nums.count - 1 {
        var sum = nums[i]
        for j in i + 1 ..< nums.count {
            sum += nums[j]
            if sum % k == 0 {
                return true
            }
        }
    }
    return false
}
*/

func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
    var sum = 0
    var dict: [Int: Int] = [:]
    dict[0] = -1
    for i in 0 ..< nums.count {
        sum += nums[i]
        if let val = dict[sum % k] {
            if i - val >= 2 {
                return true
            }
        } else {
            dict[sum % k] = i
        }
    }
    return false
}

let nums = [23,2,6,4,7]//[23,2,6,4,7]//[23,2,4,6,7]
let k = 13//6
checkSubarraySum(nums, k)
