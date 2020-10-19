/*
 Numbers With Same Consecutive Differences
 
 Return all non-negative integers of length n such that the absolute difference between every two consecutive digits is k.

 Note that every number in the answer must not have leading zeros except for the number 0 itself. For example, 01 has one leading zero and is invalid, but 0 is valid.

 You may return the answer in any order.

  

 Example 1:

 Input: n = 3, k = 7
 Output: [181,292,707,818,929]
 Explanation: Note that 070 is not a valid number, because it has leading zeroes.
 Example 2:

 Input: n = 2, k = 1
 Output: [10,12,21,23,32,34,43,45,54,56,65,67,76,78,87,89,98]
 Example 3:

 Input: n = 2, k = 0
 Output: [11,22,33,44,55,66,77,88,99]
 Example 4:

 Input: n = 2, k = 1
 Output: [10,12,21,23,32,34,43,45,54,56,65,67,76,78,87,89,98]
 Example 5:

 Input: n = 2, k = 2
 Output: [13,20,24,31,35,42,46,53,57,64,68,75,79,86,97]
  

 Constraints:

 2 <= n <= 9
 0 <= k <= 9

*/


import Foundation

func numsSameConsecDiff(_ n: Int, _ k: Int) -> [Int] {
    var results: [Int] = []
    for i in 1...9 {
        doRecurse(i, k, n, &results)
    }
    return results
}

func doRecurse(_ cur: Int, _ diff: Int, _ n: Int, _ results: inout [Int]) {
    if Int(floor(log10(Double(cur)))) + 1 == n {
        results.append(cur)
        return
    }
    let next = (cur % 10) + diff
    if next <= 9 {
        doRecurse(cur * 10 + next, diff, n, &results)
    }
    if diff != 0 {
        let prev = (cur % 10) - diff
        if prev >= 0 {
            doRecurse(cur * 10 + prev, diff, n, &results)
        }
    }
}


numsSameConsecDiff(2, 1)
