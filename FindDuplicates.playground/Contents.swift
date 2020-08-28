// Find All Duplicates in an Array
// Given an array of integers, 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.
// Find all the elements that appear twice in this array.
// TODO
// Could you do it without extra space and in O(n) runtime?
// Input:
// [4,3,2,7,8,2,3,1]
// Output:
// [2,3]

import Foundation


func findDuplicates(_ nums: [Int]) -> [Int] {
    var dict: [Int: Int] = [:]
    nums.forEach { num in
        if dict[num] == nil {
            dict[num] = 1
        } else {
            dict[num] = dict[num]! + 1
        }
    }
    var result: [Int] = []
    for (key, value) in dict {
        if value > 1 {
            result.append(key)
        }
    }
    return result
}

findDuplicates([4,3,2,7,8,2,3,1])

