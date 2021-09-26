/*
 
 tags:Facebook
 
 1004. Max Consecutive Ones III
 
 Given a binary array nums and an integer k, return the maximum number of consecutive 1's in the array if you can flip at most k 0's.

 Example 1:
 Input: nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2
 Output: 6
 Explanation: [1,1,1,0,0,1,1,1,1,1,1]
 Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.
 
 Example 2:
 Input: nums = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], k = 3
 Output: 10
 Explanation: [0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1]
 Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.
  
 Constraints:
 1 <= nums.length <= 105
 nums[i] is either 0 or 1.
 0 <= k <= nums.length
 
 */
func longestOnes(_ nums: [Int], _ k: Int) -> Int {
    var left = 0
    var right = 0
    var zeroCount = 0
    var maxLength = 0
    while right < nums.count {
        if nums[right] == 0 {
            zeroCount += 1
        }
        while zeroCount > k {
            if nums[left] == 0 {
                zeroCount -= 1
            }
            left += 1
        }
        maxLength = max(maxLength, right - left + 1)
        right += 1
    }
    return maxLength
}

let nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2
longestOnes(nums, k)

let nums2 = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], k2 = 3
longestOnes(nums2, k2)
