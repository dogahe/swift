/*
 414. Third Maximum Number

 Given integer array nums, return the third maximum number in this array. If the third maximum does not exist, return the maximum number.

 Example 1:

 Input: nums = [3,2,1]
 Output: 1
 Explanation: The third maximum is 1.
 Example 2:

 Input: nums = [1,2]
 Output: 2
 Explanation: The third maximum does not exist, so the maximum (2) is returned instead.
 Example 3:

 Input: nums = [2,2,3,1]
 Output: 1
 Explanation: Note that the third maximum here means the third maximum distinct number.
 Both numbers with value 2 are both considered as second maximum.
  
 Constraints:

 1 <= nums.length <= 104
 -231 <= nums[i] <= 231 - 1
  
 Follow up: Can you find an O(n) solution?
 
 */
import UIKit

func thirdMax(_ nums: [Int]) -> Int {
    let s: Set<Int> = Set(nums)
    var numsCopy = Array(s)
    if numsCopy.count < 3 {
        return numsCopy.max()!
    }
    return randomizedSelect(&numsCopy, 0, numsCopy.count - 1, 3)
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


let nums = [2,1]
thirdMax(nums)
