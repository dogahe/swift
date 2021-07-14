//
//  main.swift
//  ShortestSubarrayWithSumAtLeastK
//
//  Created by Behzad Dogahe on 7/13/21.
//

/*
 862. Shortest Subarray with Sum at Least K
 
 Return the length of the shortest, non-empty, contiguous subarray of nums with sum at least k.

 If there is no non-empty subarray with sum at least k, return -1.

 Example 1:

 Input: nums = [1], k = 1
 Output: 1
 Example 2:

 Input: nums = [1,2], k = 4
 Output: -1
 Example 3:

 Input: nums = [2,-1,2], k = 3
 Output: 3
  

 Note:

 1 <= nums.length <= 50000
 -105 <= nums[i] <= 105
 1 <= k <= 109
 
 
 */

func shortestSubarray(_ nums: [Int], _ k: Int) -> Int {
    var p: [Int] = [0]
    var sum = 0
    for i in 0 ..< nums.count {
        sum += nums[i]
        p.append(sum)
    }
    var result: Int = Int.max
    var arr: [Int] = []
    for i in 0 ..< p.count {
        while !arr.isEmpty && p[i] <= p[arr.last!] {
            arr.removeLast()
        }
        while !arr.isEmpty && (p[i] >= p[arr.first!] + k) {
            result = min(result, i - arr.removeFirst())
        }
        arr.append(i)
    }
    if result < Int.max {
        return result
    }
    return -1
}

let nums = [2, 3, -4, 5, 1, 2]
let k = 6
let sh = shortestSubarray(nums, k)
print(sh)

let nums1 = [1]
let k1 = 1
let sh1 = shortestSubarray(nums1, k1)
print(sh1)

let nums2 = [84,-37,32,40,95]
let k2 = 167
let sh2 = shortestSubarray(nums2, k2)
print(sh2)


