//
//  main.swift
//  CTCI_4_3
//
//  Created by Behzad Dogahe on 5/23/21.
//

/*
 

Given sorted (increasing order) array, write an algorithm to create a binary search tree with minimal height.
 
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

func createMinimalBST(_ arr: [Int]) -> TreeNode? {
    if arr.isEmpty {
        return nil
    }
    let node = TreeNode(arr[(arr.count - 1)/2])
    node.left = createMinimalBST(Array(arr[0..<(arr.count - 1)/2]))
    node.right = createMinimalBST(Array(arr[(arr.count - 1)/2 + 1..<arr.count]))
    return node
}

let arr: [Int] = [1, 3, 5, 7, 9, 12, 34, 56]

let tree = createMinimalBST(arr)
print(tree)

