/*
 
 
 410. Split Array Largest Sum
 
 Given an array nums which consists of non-negative integers and an integer m, you can split the array into m non-empty continuous subarrays.

 Write an algorithm to minimize the largest sum among these m subarrays.

 Example 1:
 Input: nums = [7,2,5,10,8], m = 2
 Output: 18
 Explanation:
 There are four ways to split nums into two subarrays.
 The best way is to split it into [7,2,5] and [10,8],
 where the largest sum among the two subarrays is only 18.
 
 Example 2:
 Input: nums = [1,2,3,4,5], m = 2
 Output: 9
 
 Example 3:
 Input: nums = [1,4,4], m = 3
 Output: 4
  
 Constraints:

 1 <= nums.length <= 1000
 0 <= nums[i] <= 106
 1 <= m <= min(50, nums.length)
 
 */
func splitArray(_ nums: [Int], _ m: Int) -> Int {
    var minVal: Int = Int.max
    dfs(nums, 0, 0, m, 0, 0, &minVal)
    return minVal
}

func dfs(_ nums: [Int], _ index: Int, _ numOfSubArrays: Int, _ m: Int, _ currSum: Int, _ currMax: Int, _ minVal: inout Int) {
    if index == nums.count && numOfSubArrays == m {
        minVal = min(minVal, currMax)
        return
    }
    if index == nums.count {
        return
    }
    if index > 0 {
        dfs(nums, index + 1, numOfSubArrays, m, currSum + nums[index], max(currMax, currSum + nums[index]), &minVal)
    }
    if numOfSubArrays < m {
        dfs(nums, index + 1, numOfSubArrays + 1, m, nums[index],  max(currMax, nums[index]), &minVal)
    }
}


let nums = [7,2,5,10,8], m = 2
splitArray(nums, m)

let nums2 = [1,2,3,4,5], m2 = 2
splitArray(nums2, m2)

let nums3 = [1,4,4], m3 = 3
splitArray(nums3, m3)
