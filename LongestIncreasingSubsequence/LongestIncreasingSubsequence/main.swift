//
//  main.swift
//  LongestIncreasingSubsequence
//
//  Created by Behzad Dogahe on 5/4/21.
//
/*

 300. Longest Increasing Subsequence
 
 Given an integer array nums, return the length of the longest strictly increasing subsequence.

 A subsequence is a sequence that can be derived from an array by deleting some or no elements without changing the order of the remaining elements. For example, [3,6,2,7] is a subsequence of the array [0,3,1,6,2,2,7].

  

 Example 1:

 Input: nums = [10,9,2,5,3,7,101,18]
 Output: 4
 Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
 Example 2:

 Input: nums = [0,1,0,3,2,3]
 Output: 4
 Example 3:

 Input: nums = [7,7,7,7,7,7,7]
 Output: 1
  

 Constraints:

 1 <= nums.length <= 2500
 -104 <= nums[i] <= 104
  

 Follow up:

 Could you come up with the O(n2) solution?
 Could you improve it to O(n log(n)) time complexity?
 Order nlog(n) solution: https://www.geeksforgeeks.org/longest-increasing-subsequence-dp-3/
 
 */
func lengthOfLIS(_ nums: [Int]) -> Int {
    let m = nums.count
    if m == 1 {
        return 1
    }
    var l = Array(repeating: 1, count: m)
    for i in 1 ... m - 1 {
        for j in 0 ..< i {
            if nums[i] > nums[j] && l[i] < l[j] + 1 {
                l[i] = l[j] + 1
            }
        }
    }
    var max: Int = 0
    for i in 0 ..< m {
        if l[i] > max {
            max = l[i]
        }
    }
    return max
}

let nums = [10, 22, 9, 33, 21, 50, 41, 60]//[7,7,7,7,7,7,7]//[0,1,0,3,2,3]//[10,9,2,5,3,7,101,18]
print(lengthOfLIS(nums))



