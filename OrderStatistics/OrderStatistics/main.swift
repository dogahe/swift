//
//  main.swift
//  OrderStatistics
//
//  Created by Behzad Dogahe on 3/16/21.
//

import Foundation

/* Smallest
func partition(_ arr: inout [Int], _ p: Int, _ r: Int) -> Int {
    let x = arr[r]
    var i = p - 1
    for j in p ... r - 1 {
        if arr[j] <= x {
            i += 1
            let temp = arr[i]
            arr[i] = arr[j]
            arr[j] = temp
        }
    }
    let temp = arr[i + 1]
    arr[i + 1] = arr[r]
    arr[r] = temp
    return i + 1
}

func randomizedPartition(_ arr: inout [Int], _ p: Int, _ r: Int) -> Int {
    let i = Int.random(in: p ... r)
    let temp = arr[i]
    arr[i] = arr[r]
    arr[r] = temp
    return partition(&arr, p, r)
}

func randomizedSelect(_ arr: inout [Int], _ p: Int, _ r: Int, _ i: Int) -> Int {
    if p == r {
        return arr[p]
    }
    let q = randomizedPartition(&arr, p, r)
    let k = q - p + 1
    if i == k {
        return arr[q]
    } else if i < k {
        return randomizedSelect(&arr, p, q - 1, i)
    } else {
        return randomizedSelect(&arr, q + 1, r, i - k)
    }
}
*/

// Largest
func partition(_ arr: inout [Int], _ p: Int, _ r: Int) -> Int {
    let x = arr[r]
    var i = p - 1
    for j in p ... r - 1 {
        if arr[j] >= x {
            i += 1
            let temp = arr[i]
            arr[i] = arr[j]
            arr[j] = temp
        }
    }
    let temp = arr[i + 1]
    arr[i + 1] = arr[r]
    arr[r] = temp
    return i + 1
}

func randomizedPartition(_ arr: inout [Int], _ p: Int, _ r: Int) -> Int {
    let i = Int.random(in: p ... r)
    let temp = arr[i]
    arr[i] = arr[r]
    arr[r] = temp
    return partition(&arr, p, r)
}

func randomizedSelect(_ arr: inout [Int], _ p: Int, _ r: Int, _ i: Int) -> Int {
    if p == r {
        return arr[p]
    }
    let q = randomizedPartition(&arr, p, r)
    let k = q - p + 1
    if i == k {
        return arr[q]
    } else if i < k {
        return randomizedSelect(&arr, p, q - 1, i)
    } else {
        return randomizedSelect(&arr, q + 1, r, i - k)
    }
}

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    var numsCopy = nums
    return randomizedSelect(&numsCopy, 0, nums.count - 1, k)
}

//var arr = [3,2,1,5,6,4]
//var k = 2

var arr = [3,2,3,1,2,4,5,5,6]
var k = 4
    
//partition(&arr, 0, 7)

//print(randomizedSelect(&arr, 0, 7, 5))

//print(arr)

// Need to change this to solve:
// https://leetcode.com/problems/kth-largest-element-in-an-array/

print(findKthLargest(arr, k))
