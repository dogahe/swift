/*
 Average of Levels in Binary Tree
 
 Given a non-empty binary tree, return the average value of the nodes on each level in the form of an array.
 Example 1:

 Input:
     3
    / \
   9  20
     /  \
    15   7
 
 Output: [3, 14.5, 11]
 Explanation:
 The average value of nodes on level 0 is 3,  on level 1 is 14.5, and on level 2 is 11. Hence return [3, 14.5, 11].
 Note:

 The range of node's value is in the range of 32-bit signed integer.
 
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

func averageOfLevels(_ root: TreeNode?) -> [Double] {
    var arr: [[Int]] = []
    helper(root, level: 0, arr: &arr)
    var result: [Double] = []
    for i in 0 ..< arr.count {
        let elems = arr[i]
        let sum = elems.reduce(0, +)
        result.append(Double(sum)/Double(elems.count))
    }
    return result
}

func helper(_ node: TreeNode?, level: Int, arr: inout [[Int]]) {
    if node == nil {
        return
    }
    if level == arr.count {
        arr.append([node!.val])
        print("A. \(arr)")
    } else {
        var a = arr[level]
        a.append(node!.val)
        arr[level] = a
        print("B. \(arr)")
    }
    helper(node!.left, level: level + 1, arr: &arr)
    helper(node!.right, level: level + 1, arr: &arr)
}

let myTree: TreeNode = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))

averageOfLevels(myTree)
