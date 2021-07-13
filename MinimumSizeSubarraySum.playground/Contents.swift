/*
 209. Minimum Size Subarray Sum
 
 Given an array of positive integers nums and a positive integer target, return the minimal length of a contiguous subarray [numsl, numsl+1, ..., numsr-1, numsr] of which the sum is greater than or equal to target. If there is no such subarray, return 0 instead.

 Example 1:

 Input: target = 7, nums = [2,3,1,2,4,3]
 Output: 2
 Explanation: The subarray [4,3] has the minimal length under the problem constraint.
 
 Example 2:
 Input: target = 4, nums = [1,4,4]
 Output: 1
 
 Example 3:
 Input: target = 11, nums = [1,1,1,1,1,1,1,1]
 Output: 0
  

 Constraints:
 1 <= target <= 109
 1 <= nums.length <= 105
 1 <= nums[i] <= 105
  
 Follow up: If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log(n)).
 
 */

func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
    var left = 0
    var right = 0
    var sum = 0
    var minLength = Int.max
    while right < nums.count {
        sum += nums[right]
        while sum >= target {
            minLength = min(minLength, right - left + 1)
            sum -= nums[left]
            left += 1
        }
        right += 1
    }
    if minLength == Int.max {
        return 0
    }
    return minLength
}


let target1 = 7
let nums1 = [2,3,1,2,4,3]
minSubArrayLen(target1, nums1)

let target2 = 4
let nums2 = [1,4,4]
minSubArrayLen(target2, nums2)

let target3 = 11
let nums3 = [1,1,1,1,1,1,1,1]
minSubArrayLen(target3, nums3)
