/*
 House Robber III
 
 The thief has found himself a new place for his thievery again. There is only one entrance to this area, called the "root." Besides the root, each house has one and only one parent house. After a tour, the smart thief realized that "all houses in this place forms a binary tree". It will automatically contact the police if two directly-linked houses were broken into on the same night.

 Determine the maximum amount of money the thief can rob tonight without alerting the police.

 Example 1:

 Input: [3,2,3,null,3,null,1]

      3
     / \
    2   3
     \   \
      3   1

 Output: 7
 Explanation: Maximum amount of money the thief can rob = 3 + 3 + 1 = 7.
 Example 2:

 Input: [3,4,5,1,3,null,1]

      3
     / \
    4   5
   / \   \
  1   3   1

 Output: 9
 Explanation: Maximum amount of money the thief can rob = 4 + 5 = 9.
 
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

func rob(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    
    let result = doRob(root)
    return max(result.0, result.1)
}

func doRob(_ root: TreeNode?) -> (Int, Int) {
    if root == nil {
        return (0, 0)
    }
    
    let left = doRob(root!.left)
    let right = doRob(root!.right)
    
    return (root!.val + left.1 + right.1, max(left.0, left.1) + max(right.0, right.1))
}


// let root = TreeNode(3, TreeNode(2, nil, TreeNode(3)), TreeNode(3, nil, TreeNode(1)))
let root = TreeNode(3, TreeNode(4, TreeNode(1), TreeNode(3)), TreeNode(5, nil, TreeNode(1)))
rob(root)
