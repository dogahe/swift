/*
 94. Binary Tree Inorder Traversal
 Medium

 Given the root of a binary tree, return the inorder traversal of its nodes' values.

 Example 1:

 Input: root = [1,null,2,3]
 Output: [1,3,2]
 Example 2:

 Input: root = []
 Output: []
 Example 3:

 Input: root = [1]
 Output: [1]
 Example 4:


 Input: root = [1,2]
 Output: [2,1]
 Example 5:


 Input: root = [1,null,2]
 Output: [1,2]
  
 Constraints:

 The number of nodes in the tree is in the range [0, 100].
 -100 <= Node.val <= 100
  

 Follow up:

 Recursive solution is trivial, could you do it iteratively?
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

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var result: [Int] = []
    helper(root, result: &result)
    return result
 }

func helper(_ node: TreeNode?, result: inout [Int]) {
    if node == nil {
        return
    }
    helper(node!.left, result: &result)
    result.append(node!.val)
    helper(node!.right, result: &result)
}

func inorderTraversalIterative(_ root: TreeNode?) -> [Int] {
    var result: [Int] = []
    var stack: [TreeNode] = []
    var curr = root
    while curr != nil || !stack.isEmpty {
        while curr != nil {
            stack.append(curr!)
            curr = curr!.left
        }
        curr = stack.popLast()
        result.append(curr!.val)
        curr = curr!.right
    }
    return result
 }
