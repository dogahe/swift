/*

 3Sum
 
 Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

 Notice that the solution set must not contain duplicate triplets.

 Example 1:

 Input: nums = [-1,0,1,2,-1,-4]
 Output: [[-1,-1,2],[-1,0,1]]
 Example 2:

 Input: nums = []
 Output: []
 Example 3:

 Input: nums = [0]
 Output: []
  
 Constraints:

 0 <= nums.length <= 3000
 -105 <= nums[i] <= 105
 
*/

func threeSum(_ nums: [Int]) -> [[Int]] {
    if nums.count < 3 {
        return []
    }
    let numsSorted = nums.sorted()
    var output: [[Int]] = []
    for i in 0 ..< numsSorted.count - 2 {
        if i == 0 || numsSorted[i] != numsSorted[i - 1] {
            var j = i + 1
            var k = numsSorted.count - 1
            while j < k {
                let sum = numsSorted[i] + numsSorted[j] + numsSorted[k]
                if sum == 0 {
                    output.append([numsSorted[i], numsSorted[j], numsSorted[k]])
                    while j < k && numsSorted[j] == numsSorted[j + 1] { j += 1}
                    while j < k && numsSorted[k] == numsSorted[k - 1] { k -= 1}
                    j += 1
                    k -= 1
                } else if sum < 0 {
                    j += 1
                } else {
                    k -= 1
                }
            }
        }
    }
    return output
}


let nums: [Int] = [-1,0,1,2,-1,-4]

threeSum(nums)



