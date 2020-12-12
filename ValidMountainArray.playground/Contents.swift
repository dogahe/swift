/*
 Valid Mountain Array
 
 Given an array of integers arr, return true if and only if it is a valid mountain array.

 Recall that arr is a mountain array if and only if:

 arr.length >= 3
 There exists some i with 0 < i < arr.length - 1 such that:
 arr[0] < arr[1] < ... < arr[i - 1] < A[i]
 arr[i] > arr[i + 1] > ... > arr[arr.length - 1]
 
 Example 1:

 Input: arr = [2,1]
 Output: false
 Example 2:

 Input: arr = [3,5,5]
 Output: false
 Example 3:

 Input: arr = [0,3,2,1]
 Output: true
  

 Constraints:

 1 <= arr.length <= 104
 0 <= arr[i] <= 104
 
 */
import Foundation

func validMountainArray(_ arr: [Int]) -> Bool {
    var hrp: Bool =  false
    for i in 0 ..< arr.count - 1 {
        let a = arr[i]
        let b = arr[i + 1]
        if a == b {
            return false
        } else if b < a && !hrp {
            if i == 0 {
                return false
            } else {
                hrp = true
            }
        } else if b > a && hrp {
            return false
        }
    }
    return hrp
}

let arr = [0,3,2,1]//[3,5,5]//[2,1]

validMountainArray(arr)
