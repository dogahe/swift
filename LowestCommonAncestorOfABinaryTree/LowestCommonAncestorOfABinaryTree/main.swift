//
//  main.swift
//  LowestCommonAncestorOfABinaryTree
//
//  Created by Behzad Dogahe on 5/23/21.
//

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

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
   return helper(root, p, q)
}

func helper(_ node: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    if node == nil {
        return nil
    }
    if (isChild(node!.left, node: p) && isChild(node!.right, node: q)) ||
        (isChild(node!.left, node: q) && isChild(node!.right, node: p)) || node === p || node === q {
        return node
    }
    if isChild(node!.left, node: p) {
        return helper(node!.left, p, q)
    } else {
        return helper(node!.right, p, q)
    }
}

func isChild(_ root: TreeNode?, node: TreeNode?) -> Bool {
    if root === node {
        return true
    }
    if root == nil {
        return false
    }
    return isChild(root?.left, node: node) || isChild(root?.right, node: node)
}


var node6 = TreeNode(6)
var node7 = TreeNode(7)


var left = TreeNode(5, node6, TreeNode(2, node7, TreeNode(4)))
var right = TreeNode(1, TreeNode(0), TreeNode(8))
let tree = TreeNode(3, left, right)

let n = lowestCommonAncestor(tree, node6, node7)
print(n?.val)
