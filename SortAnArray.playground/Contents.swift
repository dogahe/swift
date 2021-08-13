/*
 
 912. Sort an Array
 
 Given an array of integers nums, sort the array in ascending order.

 Example 1:
 Input: nums = [5,2,3,1]
 Output: [1,2,3,5]
 
 Example 2:
 Input: nums = [5,1,1,2,0,0]
 Output: [0,0,1,1,2,5]

 Constraints:

 1 <= nums.length <= 5 * 104
 -5 * 104 <= nums[i] <= 5 * 104
 
 */

func sortArray(_ nums: [Int]) -> [Int] {
    var numsCopy = nums
    mergeSort(&numsCopy, 0, nums.count - 1)
    return numsCopy
}

func mergeSort(_ nums: inout [Int], _ p: Int, _ r: Int) {
    if p < r {
        let q = (p + r)/2
        mergeSort(&nums, p, q)
        mergeSort(&nums, q + 1, r)
        merge(&nums, p, q, r)
    }
}

func merge(_ nums: inout [Int], _ p: Int, _ q: Int, _ r: Int) {
    var left: [Int] = []
    for i in p ... q {
        left.append(nums[i])
    }
    left.append(Int.max)
    var right: [Int] = []
    for i in q + 1 ... r {
        right.append(nums[i])
    }
    right.append(Int.max)
    var i = 0
    var j = 0
    for k in p ... r {
        if left[i] <= right[j] {
            nums[k] = left[i]
            i += 1
        } else {
            nums[k] = right[j]
            j += 1
        }
    }
}

let nums = [5,2,3,1]
sortArray(nums)
