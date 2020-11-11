/*
 Maximum Difference Between Node and Ancestor

 Given the root of a binary tree, find the maximum value V for which there exist different nodes A and B where V = |A.val - B.val| and A is an ancestor of B.

 A node A is an ancestor of B if either: any child of A is equal to B, or any child of A is an ancestor of B.

 Example 1:
 
 Input: root = [8,3,10,1,6,null,14,null,null,4,7,13]
 Output: 7
 Explanation: We have various ancestor-node differences, some of which are given below :
 |8 - 3| = 5
 |3 - 7| = 4
 |8 - 1| = 7
 |10 - 13| = 3
 Among all possible differences, the maximum value of 7 is obtained by |8 - 1| = 7.
 
 Example 2:
 
 Input: root = [1,null,2,null,0,3]
 Output: 3
 
 Constraints:

 The number of nodes in the tree is in the range [2, 5000].
 0 <= Node.val <= 105
 

 */

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

// Solution I

var result:Int = 0

func maxAncestorDiff(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    result = 0
    helper(root, root!.val, root!.val)
    return result
}

func helper(_ node: TreeNode?, _ curMin: Int, _ curMax: Int) {
    if node == nil {
        return
    }
    let possibleResult = max(abs(curMax - node!.val), abs(curMin - node!.val))
    result = max(result, possibleResult)
    let maxVal = max(curMax, node!.val)
    let minVal = min(curMin, node!.val)
    helper(node!.left, minVal, maxVal)
    helper(node!.right, minVal, maxVal)
    return
}

// Solution II

func maxAncestorDiffII(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    return helperII(root, root!.val, root!.val)
}

func helperII(_ node: TreeNode?, _ curMin: Int, _ curMax: Int) -> Int {
    if node == nil {
        return curMax - curMin
    }
    let maxVal = max(curMax, node!.val)
    let minVal = min(curMin, node!.val)
    let left = helperII(node!.left, minVal, maxVal)
    let right = helperII(node!.right, minVal, maxVal)
    return max(left, right)
}


let myTree: TreeNode = TreeNode(8, TreeNode(3, TreeNode(1), TreeNode(6,  TreeNode(4), TreeNode(7))), TreeNode(10, nil, TreeNode(14, TreeNode(13), nil)))

maxAncestorDiffII(myTree)
