//
//  main.swift
//  LongestZigZagSubsequence
//
//  Created by Behzad Dogahe on 5/9/21.
//

/*
 
 Longest Zig-Zag Subsequence
 
 The longest Zig-Zag subsequence problem is to find length of the longest subsequence of given sequence such that all elements of this are alternating.
 If a sequence {x1, x2, .. xn} is alternating sequence then its element satisfy one of the following relation :

   x1 < x2 > x3 < x4 > x5 < …. xn or
   x1 > x2 < x3 > x4 < x5 > …. xn
 Examples :

 Input: arr[] = {1, 5, 4}
 Output: 3
 The whole arrays is of the form  x1 < x2 > x3

 Input: arr[] = {1, 4, 5}
 Output: 2
 All subsequences of length 2 are either of the form
 x1 < x2; or x1 > x2

 Input: arr[] = {10, 22, 9, 33, 49, 50, 31, 60}
 Output: 6
 The subsequences {10, 22, 9, 33, 31, 60} or
 {10, 22, 9, 49, 31, 60} or {10, 22, 9, 50, 31, 60}
 are longest Zig-Zag of length 6.
 
 
 */

func longestZigZag(_ nums: [Int]) -> Int {
    let m = nums.count
    if m == 1 {
        return 1
    }
    var lz: [(Int, Int?)] = Array(repeating: (1, nil), count: m)
    for i in 1 ... m - 1 {
        for j in 0 ..< i {
            if lz[j].1 == nil {
                if nums[i] > nums[j] {
                    if lz[j].0 + 1 > lz[i].0 {
                        lz[i].0 = lz[j].0 + 1
                        lz[i].1 = 1
                    }
                } else {
                    if lz[j].0 + 1 > lz[i].0 {
                        lz[i].0 = lz[j].0 + 1
                        lz[i].1 = -1
                    }
                }
            } else if lz[j].1 == 1 {
                if nums[i] < nums[j] {
                    if lz[j].0 + 1 > lz[i].0 {
                        lz[i].0 = lz[j].0 + 1
                        lz[i].1 = -1
                    }
                }
            } else {
                if nums[i] > nums[j] {
                    if lz[j].0 + 1 > lz[i].0 {
                        lz[i].0 = lz[j].0 + 1
                        lz[i].1 = 1
                    }
                }
            }
        }
    }
    
    var max: Int = 1
    for i in 0 ..< m {
        if lz[i].0 > max {
            max = lz[i].0
        }
    }
    return max
}

let nums = [1,17,5,10,13,15,10,5,16,8]
/*[374, 40, 854, 203, 203, 156, 362, 279, 812, 955,
            600, 947, 978, 46, 100, 953, 670, 862, 568, 188,
            67, 669, 810, 704, 52, 861, 49, 640, 370, 908,
            477, 245, 413, 109, 659, 401, 483, 308, 609, 120,
            249, 22, 176, 279, 23, 22, 617, 462, 459, 244]
 */
 //[70, 55, 13, 2, 99, 2, 80, 80, 80, 80, 100, 19, 7, 5, 5, 5, 1000, 32, 32]//[1, 2, 3, 4, 5, 6, 7, 8, 9]//[44]//[1, 17, 5, 10, 13, 15, 10, 5, 16, 8]//[1, 7, 4, 9, 2, 5]
print(longestZigZag(nums))

