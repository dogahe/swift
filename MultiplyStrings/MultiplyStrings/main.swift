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

func rotate(_ matrix: inout [[Int]]) {
    let n = matrix.count
    for row in 0 ..< (n + 1)/2 {
        for col in 0 ..< n/2 {
            let temp = matrix[n - 1 - col][row]
            matrix[n - 1 - col][row] = matrix[n - 1 - row][n - 1 - col]
            matrix[n - 1 - row][n - 1 - col] = matrix[col][n - 1 - row]
            matrix[col][n - 1 - row] = matrix[row][col]
            matrix[row][col] = temp
        }
    }
}

var matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]//[[1,2,3],[4,5,6],[7,8,9]]
rotate(&matrix)
print(matrix)

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    let m = matrix.count
    let n = matrix[0].count
    var minRow = 1
    var maxRow = m - 1
    var minCol = 0
    var maxCol = n - 1
    var dir = (0, 1)
    var row = 0
    var col = -1
    var output: [Int] = []
    var moves = 0
    while moves < m*n {
        if dir == (0, 1) {
            if col == maxCol {
                maxCol -= 1
                dir = (1, 0)
            }
        } else if dir == (1, 0) {
            if row == maxRow {
                maxRow -= 1
                dir = (0, -1)
            }
        } else if dir == (0, -1) {
            if col == minCol {
                minCol += 1
                dir = (-1, 0)
            }
        } else if dir == (-1, 0) {
            if row == minRow {
                minRow += 1
                dir = (0, 1)
            }
        }
        row += dir.0
        col += dir.1
        print(moves, row, col, dir)
        output.append(matrix[row][col])
        moves += 1
    }
    return output
}
//let matrix1 = [[1,2,3],[4,5,6],[7,8,9]]
let matrix1 = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
let spiral = spiralOrder(matrix1)
print(spiral)
