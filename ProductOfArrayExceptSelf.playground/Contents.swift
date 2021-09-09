/*
 
 tags:Facebook
 
 238. Product of Array Except Self
 
 Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

 You must write an algorithm that runs in O(n) time and without using the division operation.

 Example 1:
 Input: nums = [1,2,3,4]
 Output: [24,12,8,6]

 Example 2:
 Input: nums = [-1,1,0,-3,3]
 Output: [0,0,9,0,0]
  
 Constraints:

 2 <= nums.length <= 105
 -30 <= nums[i] <= 30
 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
  
 Follow up: Can you solve the problem in O(1) extra space complexity? (The output array does not count as extra space for space complexity analysis.)
 
 */
func productExceptSelf(_ nums: [Int]) -> [Int] {
    var leftProd: [Int] = []
    var prod = 1
    for i in 0 ..< nums.count {
        prod *= nums[i]
        leftProd.append(prod)
    }
    var rightProd: [Int] = []
    prod = 1
    for i in 0 ..< nums.count {
        prod *= nums[nums.count - 1 - i]
        rightProd.insert(prod, at: 0)
    }
    var result: [Int] = []
    for i in 0 ..< nums.count {
        if i == 0 {
            result.append(rightProd[i + 1])
        } else if i == nums.count - 1 {
            result.append(leftProd[i - 1])
        } else {
            result.append(leftProd[i - 1] * rightProd[i + 1])
        }
    }
    return result
}

func productExceptSelfLessSpace(_ nums: [Int]) -> [Int] {
    var leftProd: [Int] = []
    var prod = 1
    for i in 0 ..< nums.count {
        prod *= nums[i]
        leftProd.append(prod)
    }
    
    var result: [Int] = Array(repeating: 0, count: nums.count)
    prod = 1
    for i in 0 ..< nums.count {
        let index = nums.count - 1 - i
        if index == nums.count - 1 {
            result[index] = leftProd[index - 1]
        } else if index == 0 {
            result[index] = prod
        } else {
            result[index] = leftProd[index - 1] * prod
        }
        prod *= nums[index]
        
    }
    return result
}

let nums = [1,2,3,4]//[-1,1,0,-3,3]

let res = productExceptSelf(nums)
let res2 = productExceptSelfLessSpace(nums)
