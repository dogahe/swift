/*
 
 tags:Google
 
 152. Maximum Product Subarray
 
 Given an integer array nums, find a contiguous non-empty subarray within the array that has the largest product, and return the product.

 It is guaranteed that the answer will fit in a 32-bit integer.

 A subarray is a contiguous subsequence of the array.

 Example 1:
 Input: nums = [2,3,-2,4]
 Output: 6
 Explanation: [2,3] has the largest product 6.
 
 Example 2:
 Input: nums = [-2,0,-1]
 Output: 0
 Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
  
 Constraints:
 1 <= nums.length <= 2 * 104
 -10 <= nums[i] <= 10
 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
 */

func maxProduct(_ nums: [Int]) -> Int {
    var maxProd:Int = Int.min
    for i in 0 ..< nums.count {
        var accum = 1
        for j in i ..< nums.count {
            accum *= nums[j]
            maxProd = max(maxProd, accum)
        }
    }
    return maxProd
}

// O(n)

func maxProductFast(_ nums: [Int]) -> Int {
    var maxSoFar = nums[0]
    var minSoFar = nums[0]
    var maxValue = maxSoFar
    for i in 1 ..< nums.count {
        let tempMax = [nums[i], maxSoFar * nums[i], minSoFar * nums[i]].max()!
        minSoFar = [nums[i], maxSoFar * nums[i], minSoFar * nums[i]].min()!
        maxSoFar = tempMax
        maxValue = max(maxValue, maxSoFar)
    }
    return maxValue
}



let nums = [2,3,-2,4]
maxProduct(nums)
maxProductFast(nums)

let nums2 = [-2,0,-1]
maxProduct(nums2)
maxProductFast(nums2)
