/*
 
 tags:Google
 
 4. Median of Two Sorted Arrays
 
 Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.

 The overall run time complexity should be O(log (m+n)).

 Example 1:
 Input: nums1 = [1,3], nums2 = [2]
 Output: 2.00000
 Explanation: merged array = [1,2,3] and median is 2.
 
 Example 2:
 Input: nums1 = [1,2], nums2 = [3,4]
 Output: 2.50000
 Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
 
 Example 3:
 Input: nums1 = [0,0], nums2 = [0,0]
 Output: 0.00000
 
 Example 4:
 Input: nums1 = [], nums2 = [1]
 Output: 1.00000
 
 Example 5:
 Input: nums1 = [2], nums2 = []
 Output: 2.00000
  
 Constraints:
 nums1.length == m
 nums2.length == n
 0 <= m <= 1000
 0 <= n <= 1000
 1 <= m + n <= 2000
 -106 <= nums1[i], nums2[i] <= 106
 
 */
import Foundation

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var i: Int = 0
    var j: Int = 0
    
    var merged: [Int] = []
    while i < nums1.count && j < nums2.count {
        let val1 = nums1[i]
        let val2 = nums2[j]
        if val1 <= val2 {
            merged.append(val1)
            i += 1
        } else {
            merged.append(val2)
            j += 1
        }
    }
    while i < nums1.count {
        merged.append(nums1[i])
        i += 1
    }
    while j < nums2.count {
        merged.append(nums2[j])
        j += 1
    }
    if (merged.count) % 2 == 0 {
        return Double(merged[merged.count/2] + merged[merged.count/2 - 1])/2
    } else {
        return Double(merged[merged.count/2])
    }
}

func findMedianSortedArraysFast(_ nums1: [Int], _ nums2: [Int]) -> Double {
    if nums1.count > nums2.count {
     return findMedianSortedArraysFast(nums2, nums1)
    }
    let x = nums1.count
    let y = nums2.count
    var low = 0
    var high = x
    while low <= high {
        let partitionX = (low + high)/2
        let partitionY = (x + y + 1)/2 - partitionX
        let maxLeftX = partitionX == 0 ? Int.min : nums1[partitionX - 1]
        let minRightX = partitionX == x ? Int.max : nums1[partitionX]
        let maxLeftY = partitionY == 0 ? Int.min : nums2[partitionY - 1]
        let minRightY = partitionY == y ? Int.max : nums2[partitionY]
        if maxLeftX <= minRightY && maxLeftY <= minRightX {
            if (x + y) % 2 == 0 {
                return Double(max(maxLeftX, maxLeftY) + min(minRightX, minRightY))/2
            } else {
                return Double(max(maxLeftX, maxLeftY))
            }
        } else if maxLeftX > minRightY {
            high = partitionX - 1
        } else {
            low = partitionX + 1
        }
    }
    return -1
}

let nums1 = [1,2]
let nums2 = [3,4]
findMedianSortedArrays(nums1, nums2)

let nums11 = [1,3,8,9,15]
let nums22 = [7,11,18,19,21,25]
findMedianSortedArraysFast(nums11, nums22)

let nums111 = [23,26,31,35]
let nums222 = [3,5,7,9,11,16]
findMedianSortedArraysFast(nums111, nums222)
