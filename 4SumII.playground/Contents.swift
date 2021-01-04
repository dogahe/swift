/*
 4Sum II
 
 Given four lists A, B, C, D of integer values, compute how many tuples (i, j, k, l) there are such that A[i] + B[j] + C[k] + D[l] is zero.

 To make problem a bit easier, all A, B, C, D have same length of N where 0 ≤ N ≤ 500. All integers are in the range of -228 to 228 - 1 and the result is guaranteed to be at most 231 - 1.

 Example:

 Input:
 A = [ 1, 2]
 B = [-2,-1]
 C = [-1, 2]
 D = [ 0, 2]

 Output:
 2

 Explanation:
 The two tuples are:
 1. (0, 0, 0, 1) -> A[0] + B[0] + C[0] + D[1] = 1 + (-2) + (-1) + 2 = 0
 2. (1, 1, 0, 0) -> A[1] + B[1] + C[0] + D[0] = 2 + (-1) + (-1) + 0 = 0
 
 */

import Foundation

func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
    var AB: [Int] = []
    var CD: [Int] = []
    for i in 0 ..< A.count {
        for j in 0 ..< B.count {
            AB.append(A[i] + B[j])
        }
    }
    
    for i in 0 ..< C.count {
        for j in 0 ..< D.count {
            CD.append(C[i] + D[j])
        }
    }
    
    var dict: [Int:Int] = [:]
    
    for i in 0 ..< AB.count {
        if let val = dict[AB[i]] {
            dict[AB[i]] = val + 1
        } else {
            dict[AB[i]] = 1
        }
    }
    
    var sum = 0
    for i in 0 ..< CD.count {
        if let val = dict[-1*CD[i]] {
            sum += val
        }
    }
    return sum
}

let A = [ 1, 2]
let B = [-2,-1]
let C = [-1, 2]
let D = [ 0, 2]
fourSumCount(A, B, C, D)
