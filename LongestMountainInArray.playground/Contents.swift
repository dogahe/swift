/*
 Longest Mountain in Array
 
 Let's call any (contiguous) subarray B (of A) a mountain if the following properties hold:

 B.length >= 3
 There exists some 0 < i < B.length - 1 such that B[0] < B[1] < ... B[i-1] < B[i] > B[i+1] > ... > B[B.length - 1]
 (Note that B could be any subarray of A, including the entire array A.)

 Given an array A of integers, return the length of the longest mountain.

 Return 0 if there is no mountain.

 Example 1:

 Input: [2,1,4,7,3,2,5]
 Output: 5
 Explanation: The largest mountain is [1,4,7,3,2] which has length 5.
 Example 2:

 Input: [2,2,2]
 Output: 0
 Explanation: There is no mountain.
 Note:

 0 <= A.length <= 10000
 0 <= A[i] <= 10000
 Follow up:

 Can you solve it using only one pass?
 Can you solve it in O(1) space?
 
 */
import Foundation

func longestMountain(_ A: [Int]) -> Int {
    if A.count < 3 {
        return 0
    }
    var start: Int = -1
    var end: Int = -1
    var longest: Int = 0
    for index in 0 ..< A.count - 1 {
        if A[index + 1] > A[index] {
            if end != -1 {
                start = -1
                end = -1
            }
            if start == -1 {
                start = index
            }
        } else if A[index + 1] < A[index] {
            if start != -1 {
                end = index + 1
            }
            if start != -1 && end != -1 {
                longest = max(longest, end - start + 1)
            }
        } else {
            start = -1
            end = -1
        }
    }
    if start != -1 && end != -1 {
        longest = max(longest, end - start + 1)
    }
    return longest
}

longestMountain([2,1,4,7,3,2,5,8,12,23,13,10,8,7,9])
