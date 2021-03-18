/*
 
 Given an integer array nums and an integer k, return the kth largest element in the array.

 Note that it is the kth largest element in the sorted order, not the kth distinct element.

 Example 1:

 Input: nums = [3,2,1,5,6,4], k = 2
 Output: 5
 Example 2:

 Input: nums = [3,2,3,1,2,4,5,5,6], k = 4
 Output: 4
  
 Constraints:

 1 <= k <= nums.length <= 104
 -104 <= nums[i] <= 104
 
 */

import Foundation

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    var numsCopy = nums
    return randomizedSelect(&numsCopy, 0, nums.count - 1, k)
}

func partition(_ arr: inout [Int], _ p: Int, _ r: Int) -> Int {
    let x = arr[r]
    var i = p - 1
    for j in p ... r - 1 {
        if arr[j] >= x {
            i += 1
            let temp = arr[i]
            arr[i] = arr[j]
            arr[j] = temp
        }
    }
    let temp = arr[i + 1]
    arr[i + 1] = arr[r]
    arr[r] = temp
    return i + 1
}

func randomizedPartition(_ arr: inout [Int], _ p: Int, _ r: Int) -> Int {
    let i = Int.random(in: p ... r)
    let temp = arr[i]
    arr[i] = arr[r]
    arr[r] = temp
    return partition(&arr, p, r)
}

func randomizedSelect(_ arr: inout [Int], _ p: Int, _ r: Int, _ i: Int) -> Int {
    if p == r {
        return arr[p]
    }
    let q = randomizedPartition(&arr, p, r)
    let k = q - p + 1
    if i == k {
        return arr[q]
    } else if i < k {
        return randomizedSelect(&arr, p, q - 1, i)
    } else {
        return randomizedSelect(&arr, q + 1, r, i - k)
    }
}

var arr = [3,2,3,1,2,4,5,5,6]
var k = 4

findKthLargest(arr, k)
