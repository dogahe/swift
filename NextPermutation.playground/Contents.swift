/*
 Next Permutation
 
 Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.

 If such an arrangement is not possible, it must rearrange it as the lowest possible order (i.e., sorted in ascending order).

 The replacement must be in place and use only constant extra memory.

  

 Example 1:

 Input: nums = [1,2,3]
 Output: [1,3,2]
 Example 2:

 Input: nums = [3,2,1]
 Output: [1,2,3]
 Example 3:

 Input: nums = [1,1,5]
 Output: [1,5,1]
 Example 4:

 Input: nums = [1]
 Output: [1]
  

 Constraints:

 1 <= nums.length <= 100
 0 <= nums[i] <= 100
 
 Solution:
 Algorithm

 First, we observe that for any given sequence that is in descending order, no next larger permutation is possible. For example, no next permutation is possible for the following array:

 [9, 5, 4, 3, 1]
 We need to find the first pair of two successive numbers
 a[i] and a[i−1], from the right, which satisfy a[i]>a[i−1]. Now, no rearrangements to the right of
 a[i−1] can create a larger permutation since that subarray consists of numbers in descending order. Thus, we need to rearrange the numbers to the right of a[i−1] including itself.

 Now, what kind of rearrangement will produce the next larger number? We want to create the permutation just larger than the current one. Therefore, we need to replace the number a[i−1] with the number which is just larger than itself among the numbers lying to its right section, say a[j].

 Next Permutation
 We swap the numbers a[i−1] and a[j]. We now have the correct number at index i−1. But still the current permutation isn't the permutation that we are looking for. We need the smallest permutation that can be formed by using the numbers only to the right of a[i−1]. Therefore, we need to place those numbers in ascending order to get their smallest permutation.
But, recall that while scanning the numbers from the right, we simply kept decrementing the index until we found the pair a[i] and a[i−1] where, a[i]>a[i−1]. Thus, all numbers to the right of a[i−1] were already sorted in descending order. Furthermore, swapping a[i−1] and a[j] didn't change that order. Therefore, we simply need to reverse the numbers following a[i−1] to get the next smallest lexicographic permutation.

 */
import Foundation

func nextPermutation(_ nums: inout [Int]) {
    if nums.count == 1 {
        return
    }
    var i = nums.count - 1
    while i > 0 {
        let first = nums[i]
        let second = nums[i - 1]
        if first > second {
            break
        }
        i = i - 1
    }
    if i == 0 {
        nums = nums.sorted()
    } else {
        // i, i + 1, ... nums.count - 1
        var j = nums.count - 1
        while j > i - 1 {
            if nums[j] > nums[i - 1] {
                break
            }
            j -= 1
        }
        let temp = nums[j]
        nums[j] = nums[i - 1]
        nums[i - 1] = temp
        var f = 1
        while i <= nums.count - f {
            let temp = nums[nums.count - f]
            nums[nums.count - f] = nums[i]
            nums[i] = temp
            i += 1
            f += 1
        }
    }
}

var nums = [1, 3, 2]
nextPermutation(&nums)
