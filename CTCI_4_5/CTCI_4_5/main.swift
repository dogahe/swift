//
//  main.swift
//  CTCI_4_5
//
//  Created by Behzad Dogahe on 5/23/21.
//

/*
 
 Implement a function to check if a binary tree is a binary search tree.
 
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

func isBST(_ root: TreeNode?) -> Bool {
    return helper(root, Int.min, Int.max)
}

func helper(_ node: TreeNode?, _ min: Int, _ max: Int) -> Bool {
    if node == nil {
        return true
    }
    if node!.val <= max && node!.val > min {
        return helper(node!.left, min, node!.val) && helper(node!.right, node!.val, max)
    } else {
        return false
    }
    
}

let tree = TreeNode(10, TreeNode(8, TreeNode(12), TreeNode(9)), TreeNode(20))
let isIt = isBST(tree)
print(isIt)
