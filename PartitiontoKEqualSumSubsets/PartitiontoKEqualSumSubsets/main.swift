//
//  main.swift
//  PartitiontoKEqualSumSubsets
//
//  Created by Behzad Dogahe on 6/3/21.
//

func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
    var sum = nums.reduce(0, +)
    if sum % k != 0 {
        return false
    }
    sum = sum/k
    var results: [[Int]] = []
    let result = isSubsetSum(nums, sum, [], &results)
    print(results)
    return result
}

func canPartition(_ nums: [Int]) -> Bool {
    var sum = nums.reduce(0, +)
    if sum % 2 != 0 {
        return false
    }
    sum = sum/2
    var results: [[Int]] = []
    let result = isSubsetSum(nums, sum, [], &results)
    print(results)
    return result
}


func isSubsetSum(_ nums: [Int], _ sum: Int, _ subset: [Int], _ results: inout [[Int]]) -> Bool {
    if nums.count == 0 {
        if sum == 0 {
            results.append(subset)
        }
        return sum == 0
    }
    let o1 = isSubsetSum(nums.suffix(nums.count - 1), sum, subset, &results)
    var newSum = sum
    newSum -= nums[0]
    var newSubset = subset
    newSubset.append(nums[0])
    let o2 =  isSubsetSum(nums.suffix(nums.count - 1), newSum, newSubset, &results)
    return o1 || o2
}

    
//let nums = [1,5,11,5]

//print(canPartition(nums))

let nums = [4,3,2,3,5,2,1]
let k = 4

canPartitionKSubsets(nums, k)
