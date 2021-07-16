/*
 1296. Divide Array in Sets of K Consecutive Numbers
 
 Given an array of integers nums and a positive integer k, find whether it's possible to divide this array into sets of k consecutive numbers
 Return True if it is possible. Otherwise, return False.

  

 Example 1:

 Input: nums = [1,2,3,3,4,4,5,6], k = 4
 Output: true
 Explanation: Array can be divided into [1,2,3,4] and [3,4,5,6].
 Example 2:

 Input: nums = [3,2,1,2,3,4,3,4,5,9,10,11], k = 3
 Output: true
 Explanation: Array can be divided into [1,2,3] , [2,3,4] , [3,4,5] and [9,10,11].
 Example 3:

 Input: nums = [3,3,2,2,1,1], k = 3
 Output: true
 Example 4:

 Input: nums = [1,2,3,4], k = 3
 Output: false
 Explanation: Each array should be divided in subarrays of size 3.
  

 Constraints:

 1 <= k <= nums.length <= 105
 1 <= nums[i] <= 109
  

 Note: This question is the same as 846: https://leetcode.com/problems/hand-of-straights/
 */

func isPossibleDivide(_ nums: [Int], _ k: Int) -> Bool {
    if nums.count % k != 0 {
        return false
    }
    let sortedNums = nums.sorted()
    var dict: [Int:Int] = [:]
    for num in sortedNums {
        if let val = dict[num] {
            dict[num] = val + 1
        } else {
            dict[num] = 1
        }
    }
    for num in sortedNums {
        if let val = dict[num], val > 0 {
            for i in 0 ..< k {
                if let nextVal = dict[num + i], nextVal > 0 {
                    dict[num + i] = nextVal - 1
                } else {
                    return false
                }
            }
        }
    }
    return true
}

let nums1 = [1,2,3,3,4,4,5,6]
let k1 = 4
isPossibleDivide(nums1, k1)

let nums2 = [3,2,1,2,3,4,3,4,5,9,10,11]
let k2 = 3
isPossibleDivide(nums2, k2)

let nums3 = [3,3,2,2,1,1]
let k3 = 3
isPossibleDivide(nums3, k3)

let nums4 = [1, 2, 3, 4]
let k4 = 3
isPossibleDivide(nums4, k4)
