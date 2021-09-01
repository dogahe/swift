/*
 
 tags:Facebook
 
 1570. Dot Product of Two Sparse Vectors
 
 Given two sparse vectors, compute their dot product.

 Implement class SparseVector:

 SparseVector(nums) Initializes the object with the vector nums
 dotProduct(vec) Compute the dot product between the instance of SparseVector and vec
 A sparse vector is a vector that has mostly zero values, you should store the sparse vector efficiently and compute the dot product between two SparseVector.

 Follow up: What if only one of the vectors is sparse?

 Example 1:
 Input: nums1 = [1,0,0,2,3], nums2 = [0,3,0,4,0]
 Output: 8
 Explanation: v1 = SparseVector(nums1) , v2 = SparseVector(nums2)
 v1.dotProduct(v2) = 1*0 + 0*3 + 0*0 + 2*4 + 3*0 = 8

 Example 2:
 Input: nums1 = [0,1,0,0,0], nums2 = [0,0,0,0,2]
 Output: 0
 Explanation: v1 = SparseVector(nums1) , v2 = SparseVector(nums2)
 v1.dotProduct(v2) = 0*0 + 1*0 + 0*0 + 0*0 + 0*2 = 0
 
 Example 3:
 Input: nums1 = [0,1,0,0,2,0,0], nums2 = [1,0,0,0,3,0,4]
 Output: 6
  
 Constraints:
 n == nums1.length == nums2.length
 1 <= n <= 10^5
 0 <= nums1[i], nums2[i] <= 100
 
 */

class SparseVector {
    
    var size: Int
    var v: [(Int, Int)]
    
    init(_ nums: [Int]) {
        var s = 0
        v = []
        for i in 0 ..< nums.count {
            if nums[i] != 0 {
                v.append((i, nums[i]))
                s += 1
            }
        }
        size = s
    }

    // Return the dotProduct of two sparse vectors
    func dotProduct(_ vec: SparseVector) -> Int {
        var p1 = 0
        var p2 = 0
        var sum = 0
        while p1 < size && p2 < vec.size {
            if v[p1].0 == vec.v[p2].0 {
                sum += v[p1].1*vec.v[p2].1
                p1 += 1
                p2 += 1
            } else {
                if v[p1].0 < vec.v[p2].0 {
                    p1 += 1
                } else {
                    p2 += 1
                }
            }
        }
        return sum
    }
}

let nums1 = [1,0,0,2,3], nums2 = [0,3,0,4,0]
let v1 = SparseVector(nums1), v2 = SparseVector(nums2)
v1.dotProduct(v2)

let nums11 = [0,1,0,0,0], nums22 = [0,0,0,0,2]
let v11 = SparseVector(nums11), v22 = SparseVector(nums22)
v11.dotProduct(v22)

let nums111 = [0,1,0,0,2,0,0], nums222 = [1,0,0,0,3,0,4]
let v111 = SparseVector(nums111), v222 = SparseVector(nums222)
v111.dotProduct(v222)
