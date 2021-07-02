//
//  main.swift
//  DeleteNodesAndReturnForest
//
//  Created by Behzad Dogahe on 7/1/21.
//

/*
 1110. Delete Nodes And Return Forest
 
 Given the root of a binary tree, each node in the tree has a distinct value.

 After deleting all nodes with a value in to_delete, we are left with a forest (a disjoint union of trees).

 Return the roots of the trees in the remaining forest. You may return the result in any order.

 Example 1:
 Input: root = [1,2,3,4,5,6,7], to_delete = [3,5]
 Output: [[1,2,null,4],[6],[7]]
 
 Example 2:
 Input: root = [1,2,4,null,3], to_delete = [3]
 Output: [[1,2,4]]
  
 Constraints:
 The number of nodes in the given tree is at most 1000.
 Each node has a distinct value between 1 and 1000.
 to_delete.length <= 1000
 to_delete contains distinct values between 1 and 1000.
 
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


func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
    var arr: [TreeNode] = []
    helper(root, nil, nil, to_delete, &arr)
    return arr
}

func helper(_ node: TreeNode?, _ leftParent: TreeNode?,  _ rightParent: TreeNode?, _ to_delete: [Int], _ arr: inout [TreeNode]) {
    if node == nil {
        return
    }
    if to_delete.contains(node!.val) {
        if leftParent != nil {
            leftParent!.right = nil
        }
        if rightParent != nil {
            rightParent!.left = nil
        }
        helper(node!.left, nil, nil, to_delete, &arr)
        helper(node!.right, nil, nil, to_delete, &arr)
    } else {
        if leftParent == nil && rightParent == nil {
            arr.append(node!)
        }
        helper(node!.left, nil, node, to_delete, &arr)
        helper(node!.right, node, nil, to_delete, &arr)
    }
}


var tree = TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3, TreeNode(6), TreeNode(7)))

let to_delete = [3,5]

var trees = delNodes(tree, to_delete)
print(trees)


var tree2 = TreeNode(1, TreeNode(2, nil, TreeNode(3)), TreeNode(4))

let to_delete2 = [3]

var trees2 = delNodes(tree2, to_delete2)
print(trees2)
