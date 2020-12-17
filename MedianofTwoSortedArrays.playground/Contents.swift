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

let nums1 = [1,2]
let nums2 = [3,4]

findMedianSortedArrays(nums1, nums2)
