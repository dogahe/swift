//
//  main.swift
//  UniqueBinarySearchTrees
//
//  Created by Behzad Dogahe on 5/6/21.
//

/*
 96. Unique Binary Search Trees
 
 Given an integer n, return the number of structurally unique BST's (binary search trees) which has exactly n nodes of unique values from 1 to n.
 
 Example 1:
 
 Input: n = 3
 Output: 5
 Example 2:

 Input: n = 1
 Output: 1
  

 Constraints:

 1 <= n <= 19
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

func numTrees(_ n: Int) -> Int {
    var matrix: [[Int]] = Array(repeating: Array(repeating: -1, count: n + 2), count: n  + 2)
    return numOfTreesBetween(1, n, &matrix)
}

func numOfTreesBetween(_ start: Int, _ end: Int, _ matrix: inout [[Int]]) -> Int {
    var number: Int = 0
    if start > end {
        matrix[start][end] = number + 1
        return number + 1
    }
    if matrix[start][end] != -1 {
       return  matrix[start][end]
    }
    for i in start ... end {
        let leftSubtrees = numOfTreesBetween(start, i - 1, &matrix)
        let rightSubtrees = numOfTreesBetween(i + 1, end, &matrix)
        number += leftSubtrees * rightSubtrees
    }
    matrix[start][end] = number
    return number
}

print(numTrees(4))
