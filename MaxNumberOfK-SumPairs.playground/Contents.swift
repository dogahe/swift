/*
 Max Number of K-Sum Pairs
 
 You are given an integer array nums and an integer k.

 In one operation, you can pick two numbers from the array whose sum equals k and remove them from the array.

 Return the maximum number of operations you can perform on the array.

  

 Example 1:

 Input: nums = [1,2,3,4], k = 5
 Output: 2
 Explanation: Starting with nums = [1,2,3,4]:
 - Remove numbers 1 and 4, then nums = [2,3]
 - Remove numbers 2 and 3, then nums = []
 There are no more pairs that sum up to 5, hence a total of 2 operations.
 Example 2:

 Input: nums = [3,1,3,4,3], k = 6
 Output: 1
 Explanation: Starting with nums = [3,1,3,4,3]:
 - Remove the first two 3's, then nums = [1,4,3]
 There are no more pairs that sum up to 6, hence a total of 1 operation.
  

 Constraints:

 1 <= nums.length <= 105
 1 <= nums[i] <= 109
 1 <= k <= 109
 */
import Foundation

func maxOperations(_ nums: [Int], _ k: Int) -> Int {
    var dict: [Int: Int] = [:]
    for i in 0 ..< nums.count {
        let num = nums[i]
        if let val = dict[num] {
            dict[num] = val + 1
        } else {
            dict[num] = 1
        }
    }
    var ops = 0
    let sortedKeys = Array(dict.keys).sorted(by: <)
    for key1 in sortedKeys {
        if let val1 = dict[key1] {
            let key2 = k - key1
            if key2 < key1 {
                break
            }
            if let val2 = dict[key2], val2 > 0, val1 > 0 {
                if key1 == key2 {
                    ops += min(val1, val2) / 2
                } else {
                    ops += min(val1, val2)
                }
            }
        }
    }
    return ops
}

let nums = [1,2,3,4]
let k = 5

maxOperations(nums, k)
