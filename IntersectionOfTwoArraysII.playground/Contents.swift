/*
 
 tags:Facebook
 
 350. Intersection of Two Arrays II
 
 Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.

 Example 1:
 Input: nums1 = [1,2,2,1], nums2 = [2,2]
 Output: [2,2]
 
 Example 2:
 Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 Output: [4,9]
 Explanation: [9,4] is also accepted.
  
 Constraints:
 1 <= nums1.length, nums2.length <= 1000
 0 <= nums1[i], nums2[i] <= 1000
  
 Follow up:

 What if the given array is already sorted? How would you optimize your algorithm?
 What if nums1's size is small compared to nums2's size? Which algorithm is better?
 What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?
 */

func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var smaller: [Int]
    var larger: [Int]
    if nums1.count <= nums2.count {
        smaller = nums1
        larger = nums2
    } else {
        smaller = nums2
        larger = nums1
    }
    var dict: [Int: Int] = [:]
    for num in larger {
        if let val = dict[num] {
            dict[num] = val + 1
        } else {
            dict[num] = 1
        }
    }
    var intersect: [Int] = []
    for num in smaller {
        if let val = dict[num], val > 0 {
            intersect.append(num)
            dict[num] = val - 1
        }
    }
    return intersect
}

let nums1 = [1,2,2,1], nums2 = [2,2]
intersect(nums1, nums2)

let nums3 = [4,9,5], nums4 = [9,4,9,8,4]
intersect(nums3, nums4)
