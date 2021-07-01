/*
 689. Maximum Sum of 3 Non-Overlapping Subarrays
 
 Given an integer array nums and an integer k, find three non-overlapping subarrays of length k with maximum sum and return them.

 Return the result as a list of indices representing the starting position of each interval (0-indexed). If there are multiple answers, return the lexicographically smallest one.

 Example 1:

 Input: nums = [1,2,1,2,6,7,5,1], k = 2
 Output: [0,3,5]
 Explanation: Subarrays [1, 2], [2, 6], [7, 5] correspond to the starting indices [0, 3, 5].
 We could have also taken [2, 1], but an answer of [1, 3, 5] would be lexicographically larger.
 Example 2:

 Input: nums = [1,2,1,2,1,2,1,2,1], k = 2
 Output: [0,2,4]
  

 Constraints:

 1 <= nums.length <= 2 * 104
 1 <= nums[i] < 216
 1 <= k <= floor(nums.length / 3)

 Explanation:
 Intuition

 It is natural to consider an array W of each interval's sum, where each interval is the given length k.
 To create W, we can either use prefix sums, or manage the sum of the interval as a window slides along the array.

 From there, we approach the reduced problem: Given some array W and an integer k, what is the lexicographically smallest tuple of indices (i, j, l) with i + l <= j and j + k <= l that maximizes W[i] + W[j] + W[l]?

 Algorithm

 Suppose we fixed j.
 We would like to know on the intervals i ∈ [0,j−k]
 i ∈ [0,j−k] and
 l ∈ [j+k,len(W)−1]
 l ∈ [j+k,len(W)−1], where the largest value of
 W[i] (and respectively W[l]) occurs first.
 (Here, first means the smaller index.)

 We can solve these problems with dynamic programming.
 For example, if we know that i is where the largest value of
 W[i] occurs first on [0 , 5]
 , then on [0, 6]
 [
 0
 ,
 6
 ]
 [0,6] the first occurrence of the largest
 W
 [
 i
 ]
 W[i] must be either
 i
 i or
 6
 6.
 If say,
 6
 6 is better, then we set best = 6.

 At the end, left[z] will be the first occurrence of the largest value of W[i] on the interval
 i
 ∈
 [
 0
 ,
 z
 ]
 i∈[0,z], and right[z] will be the same but on the interval
 i
 ∈
 [
 z
 ,
 len
 (
 W
 )
 −
 1
 ]
 i∈[z,len(W)−1]. This means that for some choice j, the candidate answer must be (left[j - k], j, right[j + k]). We take the candidate that produces the maximum W[i] + W[j] + W[l].
 */

func maxSumOfThreeSubarrays(_ nums: [Int], _ k: Int) -> [Int] {
    let n = nums.count - k + 1
    var sums: [Int] = Array(repeating: 0, count: n)
    var sum = 0
    for i in 0 ..< nums.count {
        sum += nums[i]
        if i >= k {
            sum -= nums[i - k]
        }
        if i >= k - 1 {
            sums[i - k + 1] = sum
        }
    }
    
    var left: [Int] = Array(repeating: 0, count: n)
    var best = 0
    for i in 0 ..< n {
        if sums[i] > sums[best] {
            best = i
        }
        left[i] = best
    }
    
    var right: [Int] = Array(repeating: 0, count: n)
    best = n - 1
    for i in 0 ..< n {
        if sums[n - 1 - i] >= sums[best] {
            best = n - 1 - i
        }
        right[n - 1 - i] = best
    }
    
    var result = [-1, -1, -1]
    for j in k ..< n - k {
        if result[0] == -1 || sums[left[j - k]] + sums[j] + sums[right[j + k]] > sums[result[0]] + sums[result[1]] + sums[result[2]] {
            result[0] = left[j - k]
            result[1] = j
            result[2] = right[j + k]
        }
    }
    return result
}

let nums = [1,2,1,2,6,7,5,1]
let k = 2
print(maxSumOfThreeSubarrays(nums, k))
