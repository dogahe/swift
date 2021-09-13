/*
 
 tags:Facebook

 283. Move Zeroes
 
 Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

 Note that you must do this in-place without making a copy of the array.

 Example 1:
 Input: nums = [0,1,0,3,12]
 Output: [1,3,12,0,0]
 
 Example 2:
 Input: nums = [0]
 Output: [0]
  
 Constraints:
 1 <= nums.length <= 104
 -231 <= nums[i] <= 231 - 1

 Follow up: Could you minimize the total number of operations done?
 
 */

func moveZeroes(_ nums: inout [Int]) {
    var left = 0
    var right = 1
    while left < nums.count - 1 && right < nums.count {
        if nums[left] != 0 {
            left += 1
            right += 1
        } else {
            if nums[right] != 0 {
                nums[left] = nums[right]
                nums[right] = 0
                left += 1
                right += 1
            } else {
                right += 1
            }
        }
    }
}

var nums = [0]//[0,1,0,3,12]

moveZeroes(&nums)
