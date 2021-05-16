//
//  main.swift
//  PartitionEqualSubsetSum
//
//  Created by Behzad Dogahe on 5/5/21.
//

// SLOW

/*
func canPartition(_ nums: [Int]) -> Bool {
    var sum = nums.reduce(0, +)
    if sum % 2 != 0 {
        return false
    }
    sum = sum/2
    return isSubsetSum(nums, sum)
}

func isSubsetSum(_ nums: [Int], _ sum: Int) -> Bool {
    if nums.count == 0 {
        return sum == 0
    }
    let o1 = isSubsetSum(nums.suffix(nums.count - 1), sum)
    let o2 =  isSubsetSum(nums.suffix(nums.count - 1), sum - nums[0])
    return o1 || o2
}
*/


// FAST


func canPartition(_ nums: [Int]) -> Bool {
    var sum = nums.reduce(0, +)
    if sum % 2 != 0 {
        return false
    }
    sum = sum/2

    let n = nums.count
    
    var part: [[Bool]] = Array(repeating: Array(repeating: false, count: n + 1), count: sum + 1)
    
    for i in 0 ... n {
        part[0][i] = true
    }
    
    for i in 1 ... sum {
        for j in 1 ... n {
            part[i][j] = part[i][j - 1]
            if i >= nums[j - 1] {
                part[i][j] = part[i][j] || part[i - nums[j - 1]][j - 1]
            }
        }
    }
    return part[sum][n]
}


let nums = [3, 1, 5, 9, 12]//[1, 2, 3, 5]//[1,5,11,5]
print(canPartition(nums))

