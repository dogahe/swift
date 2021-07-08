/*
 
 1031. Maximum Sum of Two Non-Overlapping Subarrays

 Given an array nums of non-negative integers, return the maximum sum of elements in two non-overlapping (contiguous) subarrays, which have lengths firstLen and secondLen.  (For clarification, the firstLen-length subarray could occur before or after the secondLen-length subarray.)

 Formally, return the largest V for which V = (nums[i] + nums[i+1] + ... + nums[i+firstLen-1]) + (nums[j] + nums[j+1] + ... + nums[j+secondLen-1]) and either:

 0 <= i < i + firstLen - 1 < j < j + secondLen - 1 < nums.length, or
 0 <= j < j + secondLen - 1 < i < i + firstLen - 1 < nums.length.
  

 Example 1:
 Input: nums = [0,6,5,2,2,5,1,9,4], firstLen = 1, secondLen = 2
 Output: 20
 Explanation: One choice of subarrays is [9] with length 1, and [6,5] with length 2.
 
 Example 2:
 Input: nums = [3,8,1,3,2,1,8,9,0], firstLen = 3, secondLen = 2
 Output: 29
 Explanation: One choice of subarrays is [3,8,1] with length 3, and [8,9] with length 2.
 
 Example 3:
 Input: nums = [2,1,5,6,0,9,5,0,3,8], firstLen = 4, secondLen = 3
 Output: 31
 Explanation: One choice of subarrays is [5,6,0,9] with length 4, and [3,8] with length 3.
  
 Note:

 firstLen >= 1
 secondLen >= 1
 firstLen + secondLen <= nums.length <= 1000
 0 <= nums[i] <= 1000
 
 */
func maxSumTwoNoOverlap(_ nums: [Int], _ firstLen: Int, _ secondLen: Int) -> Int {
    var sum1 = 0
    var maxSum = 0
    for i in 0 ..< nums.count {
        sum1 += nums[i]
        if i >= firstLen {
            sum1 -= nums[i - firstLen]
        }
        if i >= firstLen - 1 {
            if i - firstLen + 1 >= secondLen {
                // Check on the left
                var sum2 = 0
                for j in 0 ..< i - firstLen + 1 {
                    sum2 += nums[j]
                    if j >= secondLen {
                        sum2 -= nums[j - secondLen]
                    }
                    if j >= secondLen - 1 {
                        print(sum1, sum2, i, j)
                        maxSum = max(maxSum, sum1 + sum2)
                    }
                }
            }
            if nums.count - i - 1 >= secondLen {
                // Check on the right
                var sum2 = 0
                for j in i + 1 ..< nums.count {
                    sum2 += nums[j]
                    if j - (i + 1) >= secondLen {
                        sum2 -= nums[j - secondLen]
                    }
                    if j - (i + 1) >= secondLen - 1 {
                        print(sum1, sum2, i, j)
                        maxSum = max(maxSum, sum1 + sum2)
                    }
                }
            }
        }
    }
    return maxSum
}

let nums = [0,6,5,2,2,5,1,9,4]
let firstLen = 1
let secondLen = 2
maxSumTwoNoOverlap(nums, firstLen, secondLen)
print("========")
let nums2 = [3,8,1,3,2,1,8,9,0]
let firstLen2 = 3
let secondLen2 = 2
maxSumTwoNoOverlap(nums2, firstLen2, secondLen2)
