/*
 
 tags:Google
 tags:Facebook
 
 53. Maximum Subarray
 
 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

 Example 1:

 Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.
 Example 2:

 Input: nums = [1]
 Output: 1
 Example 3:

 Input: nums = [5,4,-1,7,8]
 Output: 23
  

 Constraints:

 1 <= nums.length <= 3 * 104
 -105 <= nums[i] <= 105
  

 Follow up: If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
 */

// Return the sum only
func maxSubArray(_ nums: [Int]) -> Int {
    var currMax = 0
    var maxEndingHere = 0
    for i in 0 ..< nums.count {
        if maxEndingHere + nums[i] > 0 {
            maxEndingHere += nums[i]
        } else {
            maxEndingHere = 0
        }
        currMax = max(currMax, maxEndingHere)
    }
    if currMax == 0 {
        return nums.max()!
    }
    return currMax
}

// Return the array indices as well
func maxSubArrayWithIndices(_ nums: [Int]) -> (Int, Int, Int) {
    var start = 0, end = 0
    var currMax = 0
    var maxEndingHere = 0
    for i in 0 ..< nums.count {
        if maxEndingHere + nums[i] > 0 {
            maxEndingHere += nums[i]
        } else {
            maxEndingHere = 0
            start = i + 1
        }
        if maxEndingHere > currMax {
            currMax = maxEndingHere
            end = i
        }
    }
    if currMax == 0 {
        return (nums.max()!, -1, -1)
    }
    return (currMax, start, end)
}

let nums = [-2,1,-3,4,-1,2,1,-5,4, 10, -2]//[5,4,-1,7,8]//[1]//
maxSubArray(nums)
maxSubArrayWithIndices(nums)
