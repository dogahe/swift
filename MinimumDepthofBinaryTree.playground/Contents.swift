/*
 111. Minimum Depth of Binary Tree
 
 Given a binary tree, find its minimum depth.

 The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.

 Note: A leaf is a node with no children.

 Example 1:
 
 Input: root = [3,9,20,null,null,15,7]
 Output: 2
 Example 2:

 Input: root = [2,null,3,null,4,null,5,null,6]
 Output: 5
  

 Constraints:

 The number of nodes in the tree is in the range [0, 105].
 -1000 <= Node.val <= 1000
 
 */

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

func minDepth(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    var minD: Int = Int.max
    helper(root, 0, &minD)
    return minD
}

func helper(_ node: TreeNode?, _ depth: Int, _ minD: inout Int) {
    var localDepth: Int = depth
    if node != nil {
        localDepth += 1
    } else {
        return
    }
    if node?.left == nil && node?.right == nil {
        minD = min(minD, localDepth)
    } else {
        if localDepth >= minD {
            return
        }
        helper(node?.left, localDepth, &minD)
        helper(node?.right, localDepth, &minD)
    }
}

let tree = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
minDepth(tree)
