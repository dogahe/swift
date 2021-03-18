/*
 
 347. Top K Frequent Elements
 
 Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.

  

 Example 1:

 Input: nums = [1,1,1,2,2,3], k = 2
 Output: [1,2]
 Example 2:

 Input: nums = [1], k = 1
 Output: [1]
  

 Constraints:

 1 <= nums.legth <= 105
 k is in the range [1, the number of unique elements in the array].
 It is guaranteed that the answer is unique.
  

 Follow up: Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
 
 
 */

import Foundation

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var dict: [Int: Int] = [:]
    for num in nums {
        if let val = dict[num] {
            dict[num] = val + 1
        } else {
            dict[num] = 1
        }
    }
    let dictSorted = dict.sorted { $0.1 > $1.1 }
    var result: [Int] = []
    for (index, (key, value)) in dictSorted.enumerated() {
        result.append(key)
        if result.count == k {
            return result
        }
    }
    return []
}

let nums = [1,1,1,2,2,3]
let k = 2
topKFrequent(nums, k)
    
    

