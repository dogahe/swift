//
//  main.swift
//  MultiplyStrings
//
//  Created by Behzad Dogahe on 4/10/21.
//

import Foundation

func jump(_ nums: [Int]) -> Int {
    var results: [Int:Int] = [:]
    return helper(nums, 0, 0, &results)
}

func helper(_ nums: [Int], _ curr: Int, _ jumps: Int, _ results: inout [Int:Int]) -> Int {
    if let val = results[curr] {
        return val
    }
    if curr == nums.count - 1 {
        return jumps
    }
    var maxJumps = nums[curr]
    var minJumps = Int.max
    while maxJumps > 0 {
        if curr + maxJumps <= nums.count - 1 {
            let j = helper(nums, curr + maxJumps, jumps + 1, &results)
            minJumps = min(minJumps, j)
        }
        maxJumps -= 1
    }
    results[curr] = minJumps
    return minJumps
}

func canJump(_ nums: [Int]) -> Bool {
    var results: [Int: Bool] = [:]
    return canJumpHelper(nums, 0, 0, &results)
}

func canJumpHelper(_ nums: [Int], _ curr: Int, _ jumps: Int, _ results: inout [Int: Bool]) -> Bool {
    if let val = results[curr] {
        return val
    }
    if curr == nums.count - 1 {
        return true
    }
    var maxJumps = nums[curr]
    var canJumpFromCurrent = false
    while maxJumps > 0 {
        if curr + maxJumps <= nums.count - 1 {
            let j = canJumpHelper(nums, curr + maxJumps, jumps + 1, &results)
            if j == true {
                canJumpFromCurrent = true
                break
            }
            
        }
        maxJumps -= 1
    }
    results[curr] = canJumpFromCurrent
    return canJumpFromCurrent
}

let nums = [3,2,1,0,4]//[9,8,2,2,0,2,2,0,4,1,5,7,9,6,6,0,6,5,0,5]
print(canJump(nums))

func minPathSum(_ grid: [[Int]]) -> Int {
    let m = grid.count
    let n = grid[0].count
    var sum: [[Int]] = Array(repeating: Array(repeating: -1, count: n), count: m)
    let result = helper(m - 1, n - 1, &sum, grid)
    return result
}

func helper(_ m: Int, _ n: Int, _ sum: inout [[Int]], _ grid: [[Int]]) -> Int {
    if m < 0 || n < 0 {
        return Int.max
    }
    
    if m == 0 && n == 0 {
        sum[m][n] = grid[m][n]
        return sum[m][n]
    }
    
    let last =  min(helper(m - 1, n, &sum, grid), helper(m, n - 1, &sum, grid))
    let result = grid[m][n] + last
    sum[m][n] = result
    return result
}

let grid = [[1,2,3],[4,5,6]]//[[1,3,1],[1,5,1],[4,2,1]]

let x = minPathSum(grid)
print(x)
