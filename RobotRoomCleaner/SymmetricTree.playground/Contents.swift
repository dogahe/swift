/*
 
 
 101. Symmetric Tree
 
 Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).

 Example 1:
 
 Input: root = [1,2,2,3,4,4,3]
 Output: true
 
 Input: root = [1,2,2,null,3,null,3]
 Output: false
  
 Constraints:

 The number of nodes in the tree is in the range [1, 1000].
 -100 <= Node.val <= 100
  

 Follow up: Could you solve it both recursively and iteratively?
 
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


func isSymmetric(_ root: TreeNode?) -> Bool {
    return helper(root?.left, root?.right)
}

func helper(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
    if left == nil && right == nil {
        return true
    }
    if left == nil || right == nil {
        return false
    }
    if left!.val != right!.val {
        return false
    }
    return helper(left!.left, right!.right) && helper(left!.right, right!.left)
}
