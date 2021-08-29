/*
 
 tags:Facebook
 
 349. Intersection of Two Arrays
 
 Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must be unique and you may return the result in any order.

 Example 1:
 Input: nums1 = [1,2,2,1], nums2 = [2,2]
 Output: [2]
 
 Example 2:
 Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 Output: [9,4]
 Explanation: [4,9] is also accepted.
  
 Constraints:
 1 <= nums1.length, nums2.length <= 1000
 0 <= nums1[i], nums2[i] <= 1000
 
 */

func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var smaller: [Int]
    var larger: [Int]
    if nums1.count <= nums2.count {
        smaller = nums1
        larger = nums2
    } else {
        smaller = nums2
        larger = nums1
    }
    var dict: [Int: Bool] = [:]
    for num in larger {
        dict[num] = true
    }
    var intersect: Set<Int> = []
    for num in smaller {
        if dict[num] != nil {
            intersect.insert(num)
        }
    }
    return Array(intersect)
}

let nums1 = [1,2,2,1], nums2 = [2,2]
intersection(nums1, nums2)

let nums11 = [4,9,5], nums22 = [9,4,9,8,4]
intersection(nums11, nums22)
