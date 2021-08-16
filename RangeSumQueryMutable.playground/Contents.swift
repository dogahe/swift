/*

 307. Range Sum Query - Mutable
 
 Given an integer array nums, handle multiple queries of the following types:

 Update the value of an element in nums.
 Calculate the sum of the elements of nums between indices left and right inclusive where left <= right.
 Implement the NumArray class:

 NumArray(int[] nums) Initializes the object with the integer array nums.
 void update(int index, int val) Updates the value of nums[index] to be val.
 int sumRange(int left, int right) Returns the sum of the elements of nums between indices left and right inclusive (i.e. nums[left] + nums[left + 1] + ... + nums[right]).
  

 Example 1:
 Input
 ["NumArray", "sumRange", "update", "sumRange"]
 [[[1, 3, 5]], [0, 2], [1, 2], [0, 2]]
 Output
 [null, 9, null, 8]

 Explanation
 NumArray numArray = new NumArray([1, 3, 5]);
 numArray.sumRange(0, 2); // return 1 + 3 + 5 = 9
 numArray.update(1, 2);   // nums = [1, 2, 5]
 numArray.sumRange(0, 2); // return 1 + 2 + 5 = 8
  

 Constraints:
 1 <= nums.length <= 3 * 104
 -100 <= nums[i] <= 100
 0 <= index < nums.length
 -100 <= val <= 100
 0 <= left <= right < nums.length
 At most 3 * 104 calls will be made to update and sumRange.
 */


class NumArray {
    
    var nums: [Int]
    var tree: [Int]
    init(_ nums: [Int]) {
        self.nums = nums
        tree = Array(repeating: 0, count: 4 * nums.count)
        buildSegTree(nums, 0, 0, nums.count - 1)
    }
    
    func update(_ index: Int, _ val: Int) {
        updateValSegTree(0, 0, nums.count - 1, index, val);
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        return querySegTree(0, 0, nums.count - 1, left, right)
    }

    private func buildSegTree(_ arr: [Int], _ treeIndex: Int, _ lo: Int, _ hi: Int) {
        if lo == hi {
            tree[treeIndex] = arr[lo]
            return
        }
        let mid = lo + (hi - lo) / 2
        buildSegTree(arr, 2 * treeIndex + 1, lo, mid)
        buildSegTree(arr, 2 * treeIndex + 2, mid + 1, hi)
        tree[treeIndex] = tree[2 * treeIndex + 1] + tree[2 * treeIndex + 2]
    }
    
    private func querySegTree( _ treeIndex: Int, _ lo: Int, _ hi: Int, _ i: Int, _ j: Int) -> Int {
        if lo == i && hi == j {
            return tree[treeIndex]
        }
        let mid = lo + (hi - lo) / 2
        if i > mid {
            return querySegTree(2*treeIndex + 2, mid + 1, hi, i, j)
        } else if j <= mid {
            return querySegTree(2*treeIndex + 1, lo, mid, i, j)
        }
        let leftQuery = querySegTree(2*treeIndex + 1, lo, mid, i, mid);
        let rightQuery = querySegTree(2*treeIndex + 2, mid + 1, hi, mid + 1, j)
        return leftQuery + rightQuery
    }
    
    private func updateValSegTree( _ treeIndex: Int, _ lo: Int, _ hi: Int, _ index: Int, _ val: Int) {
        if lo == hi {
            tree[treeIndex] = val
            return
        }
        let mid = lo + (hi - lo) / 2
        if index > mid {
            updateValSegTree(2 * treeIndex + 2, mid + 1, hi, index, val)
        } else if index <= mid {
            updateValSegTree(2 * treeIndex + 1, lo, mid, index, val)
        }
        tree[treeIndex] = tree [2*treeIndex + 1] + tree[2*treeIndex + 2]
    }
}

let arr = [18, 17, 13, 19, 15, 11, 20, 12, 33, 25]
let na = NumArray(arr)
let tree = na.tree
print(tree)
print(na.sumRange(1, 3))
