/*
 
 896. Monotonic Array
 
 An array is monotonic if it is either monotone increasing or monotone decreasing.

 An array nums is monotone increasing if for all i <= j, nums[i] <= nums[j].  An array nums is monotone decreasing if for all i <= j, nums[i] >= nums[j].

 Return true if and only if the given array nums is monotonic.

 Example 1:
 Input: nums = [1,2,2,3]
 Output: true
 
 Example 2:
 Input: nums = [6,5,4,4]
 Output: true
 
 Example 3:
 Input: nums = [1,3,2]
 Output: false
 
 Example 4:
 Input: nums = [1,2,4,5]
 Output: true
 
 Example 5:
 Input: nums = [1,1,1]
 Output: true
  
 Note:

 1 <= nums.length <= 50000
 -100000 <= nums[i] <= 100000
 
 */
func isMonotonic(_ nums: [Int]) -> Bool {
    var prevInc = Int.min
    var prevDec = Int.max
    var isInc = true
    var isDec = true
    for i in 0 ..< nums.count {
        if nums[i] >= prevInc {
            prevInc = nums[i]
        } else {
            isInc = false
        }
        if nums[i] <= prevDec {
            prevDec = nums[i]
        } else {
            isDec = false
        }
    }
    if isInc || isDec {
        return true
    }
    return false
}

let nums1 = [1,2,4,5]//[1,3,2]//[6,5,4,4]//[1,2,2,3]
isMonotonic(nums1)
