/*
 Balanced Binary Tree

 Given a binary tree, determine if it is height-balanced.

 For this problem, a height-balanced binary tree is defined as:

 a binary tree in which the left and right subtrees of every node differ in height by no more than 1.
  

 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: true
 Example 2:


 Input: root = [1,2,2,3,3,null,null,4,4]
 Output: false
 Example 3:

 Input: root = []
 Output: true
  

 Constraints:

 The number of nodes in the tree is in the range [0, 5000].
 -104 <= Node.val <= 104
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

func isBalanced(_ root: TreeNode?) -> Bool {
    if root == nil {
        return true
    }
    let l = treeLength(root!.left)
    let r = treeLength(root!.right)
    if abs(l - r) <= 1 && isBalanced(root!.left) && isBalanced(root!.right) {
        return true
    } else {
        return false
    }
}

func treeLength(_ node: TreeNode?) -> Int {
    if node == nil {
        return 0
    }
    return 1 + max(treeLength(node!.left), treeLength(node!.right))
}

