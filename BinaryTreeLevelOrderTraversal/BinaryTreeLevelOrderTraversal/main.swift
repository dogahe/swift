//
//  main.swift
//  BinaryTreeLevelOrderTraversal
//
//  Created by Behzad Dogahe on 5/7/21.
//

/*
 
 tags:Facebook
 
 102. Binary Tree Level Order Traversal
 
 Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).

 Example 1:
 
 Input: root = [3,9,20,null,null,15,7]
 Output: [[3],[9,20],[15,7]]
 Example 2:

 Input: root = [1]
 Output: [[1]]
 Example 3:

 Input: root = []
 Output: []
  

 Constraints:

 The number of nodes in the tree is in the range [0, 2000].
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

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var results: [[Int]] = []
    helper(root, 0, &results)
    return results
}

func helper(_ node: TreeNode?, _ level: Int, _ results: inout [[Int]]) {
    if node == nil {
        return
    }
    if results.count == level {
        results.append([node!.val])
    } else {
        results[level].append(node!.val)
    }
    helper(node!.left, level + 1, &results)
    helper(node!.right, level + 1, &results)
}

