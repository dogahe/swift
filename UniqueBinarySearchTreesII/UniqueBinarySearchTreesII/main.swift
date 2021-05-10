//
//  main.swift
//  UniqueBinarySearchTreesII
//
//  Created by Behzad Dogahe on 5/6/21.
//

/*

95. Unique Binary Search Trees II
 
Given an integer n, return all the structurally unique BST's (binary search trees), which has exactly n nodes of unique values from 1 to n. Return the answer in any order.

 Example 1:
 
 Input: n = 3
 Output: [[1,null,2,null,3],[1,null,3,2],[2,1,3],[3,1,null,null,2],[3,2,null,1]]
 Example 2:

 Input: n = 1
 Output: [[1]]
  
 Constraints:

 1 <= n <= 8
 
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

func generateTrees(_ n: Int) -> [TreeNode?] {
    constructTrees(1, n)
}

func constructTrees(_ start: Int, _ end: Int) -> [TreeNode?] {
    var list: [TreeNode?] = []
    if start > end {
        list.append(nil)
        return list
    }
    for i in start ... end {
        let leftSubtrees = constructTrees(start, i - 1)
        let rightSubtrees = constructTrees(i + 1, end)
        for leftSubtree in leftSubtrees {
            for rightSubtree in rightSubtrees {
                let tree = TreeNode(i)
                tree.left = leftSubtree
                tree.right = rightSubtree
                list.append(tree)
            }
        }
    }
    return list
}
