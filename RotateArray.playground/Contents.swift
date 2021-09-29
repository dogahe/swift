/*
 
 tags:Facebook
 
 189. Rotate Array
 
 Given an array, rotate the array to the right by k steps, where k is non-negative.

  
 Example 1:
 Input: nums = [1,2,3,4,5,6,7], k = 3
 Output: [5,6,7,1,2,3,4]
 Explanation:
 rotate 1 steps to the right: [7,1,2,3,4,5,6]
 rotate 2 steps to the right: [6,7,1,2,3,4,5]
 rotate 3 steps to the right: [5,6,7,1,2,3,4]
 
 Example 2:
 Input: nums = [-1,-100,3,99], k = 2
 Output: [3,99,-1,-100]
 Explanation:
 rotate 1 steps to the right: [99,-1,-100,3]
 rotate 2 steps to the right: [3,99,-1,-100]
  
 Constraints:
 1 <= nums.length <= 105
 -231 <= nums[i] <= 231 - 1
 0 <= k <= 105
  
 Follow up:
 Try to come up with as many solutions as you can. There are at least three different ways to solve this problem.
 Could you do it in-place with O(1) extra space?
 
 */

func rotate(_ nums: inout [Int], _ k: Int) {
    var output: [Int] = Array(repeating: 0, count: nums.count)
    for i in 0 ..< nums.count {
        output[(i + k) % nums.count] = nums[i]
    }
    nums = output
}

func rotateNoExtraSpace(_ nums: inout [Int], _ k: Int) {
    let kk = k % nums.count
    reverse(&nums, 0, nums.count - 1)
    reverse(&nums, 0, kk - 1)
    reverse(&nums, kk, nums.count - 1)
}

func reverse(_ nums: inout [Int], _ left: Int, _ right: Int) {
    var l = left
    var r = right
    while l < r {
        let temp = nums[l]
        nums[l] = nums[r]
        nums[r] = temp
        l += 1
        r -= 1
    }
}


var nums = [1,2,3,4,5,6,7]
let k = 3
rotate(&nums, k)
print(nums)


var nums2 = [1,2,3,4,5,6,7]
let k2 = 3
rotateNoExtraSpace(&nums2, k2)
print(nums2)


var nums3 = [1]
let k3 = 3
rotateNoExtraSpace(&nums3, k3)
print(nums3)
