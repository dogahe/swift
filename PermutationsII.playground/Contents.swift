/*
 Permutations II
 
 Given a collection of numbers, nums, that might contain duplicates, return all possible unique permutations in any order.

 Example 1:

 Input: nums = [1,1,2]
 Output:
 [[1,1,2],
  [1,2,1],
  [2,1,1]]
 Example 2:

 Input: nums = [1,2,3]
 Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
  
 Constraints:

 1 <= nums.length <= 8
 -10 <= nums[i] <= 10
 */
import Foundation

func permuteUnique(_ nums: [Int]) -> [[Int]] {
    var dict: [Int:Int] = [:]
    for num in nums {
        if dict[num] == nil {
            dict[num] = 1
        } else {
            dict[num] =  dict[num]! + 1
        }
    }
    var output: [Int] = []
    var results: Set<[Int]> = []
    doPermute(output: &output, dict: &dict, length: nums.count, results: &results)
    return Array(results)
}

func doPermute(output: inout [Int], dict: inout [Int:Int], length: Int, results: inout Set<[Int]>) {
    if output.count == length {
        results.insert(output)
        return
    }
    for (key, value) in dict {
        if value == 0 {
            continue
        }
        output.append(key)
        dict[key] = value - 1
        doPermute(output: &output, dict: &dict, length: length, results: &results)
        output = output.dropLast()
        dict[key] = value
    }
}

let nums = [1,2,3,3,3,3,2,1]
print(permuteUnique(nums))
