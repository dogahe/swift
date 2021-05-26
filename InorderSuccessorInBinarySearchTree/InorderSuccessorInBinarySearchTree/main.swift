//
//  main.swift
//  InorderSuccessorInBinarySearchTree
//
//  Created by Behzad Dogahe on 5/25/21.
//

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public var parent: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; self.parent = nil }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; self.parent = nil }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
        self.left?.parent = self
        self.right?.parent = self
    }
}

func inorderSuccessor(_ root: TreeNode?) -> TreeNode? {
    var node = root
    if node == nil {
        return nil
    }
    if node!.right != nil {
        return leftMostChildOfRight(node)
    } else {
        if node === node!.parent?.left {
            return node!.parent
        } else {
            while node === node!.parent?.right {
                node = node?.parent
            }
            return node?.parent
        }
    }
}

func leftMostChildOfRight(_ node: TreeNode?) -> TreeNode? {
    var curr = node?.right
    while curr!.left != nil  {
        curr = curr!.left
    }
    return curr
}

let node1 = TreeNode(8, TreeNode(6), TreeNode(9))
let tree = TreeNode(10, node1, TreeNode(20))
let s = inorderSuccessor(node1)
print(s?.val)

