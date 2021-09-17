/*
 
tags:Google
tags:Facebook
 
124. Binary Tree Maximum Path Sum

A path in a binary tree is a sequence of nodes where each pair of adjacent nodes in the sequence has an edge connecting them. A node can only appear in the sequence at most once. Note that the path does not need to pass through the root.

 The path sum of a path is the sum of the node's values in the path.

 Given the root of a binary tree, return the maximum path sum of any path.
 
 Example 1:
 
 Input: root = [1,2,3]
 Output: 6
 Explanation: The optimal path is 2 -> 1 -> 3 with a path sum of 2 + 1 + 3 = 6.
 
 Example 2:
 
 Input: root = [-10,9,20,null,null,15,7]
 Output: 42
 Explanation: The optimal path is 15 -> 20 -> 7 with a path sum of 15 + 20 + 7 = 42.
  

 Constraints:

 The number of nodes in the tree is in the range [1, 3 * 104].
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


func maxPathSum(_ root: TreeNode?) -> Int {
    var maximum: Int = Int.min
    helper(root, &maximum)
    return maximum
}

func helper(_ node: TreeNode?, _ maximum: inout Int) -> Int {
    if node == nil {
        return 0
    }
    let l = helper(node!.left, &maximum)
    let r = helper(node!.right, &maximum)
    
    let maxSingle = max(max(l, r) + node!.val, node!.val) // This is the only case that its results can propagate to the top
    let maxTop = max(maxSingle, l + r + node!.val)
    maximum = max(maximum, maxTop)
    return maxSingle
}

let tree = TreeNode(1, TreeNode(2), TreeNode(3))

maxPathSum(tree)
