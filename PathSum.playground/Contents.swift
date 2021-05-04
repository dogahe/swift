/*

 112. Path Sum
 
 Given the root of a binary tree and an integer targetSum, return true if the tree has a root-to-leaf path such that adding up all the values along the path equals targetSum.

 A leaf is a node with no children.

 Example 1:
 
 Input: root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22
 Output: true
 Example 2:
 
 Input: root = [1,2,3], targetSum = 5
 Output: false
 Example 3:

 Input: root = [1,2], targetSum = 0
 Output: false
  

 Constraints:

 The number of nodes in the tree is in the range [0, 5000].
 -1000 <= Node.val <= 1000
 -1000 <= targetSum <= 1000
 
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

func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
    if root == nil {
        return false
    }
    return helper(root, targetSum)
}

func helper(_ node: TreeNode?, _ sum: Int) -> Bool {
    if node == nil {
        return false
    }
    if node!.left == nil && node!.right == nil {
        return sum == node!.val
    }
    let val = node!.val
    return helper(node!.left, sum - val) || helper(node!.right, sum - val)
}

let tree = TreeNode()//TreeNode(1, nil, TreeNode(3))

hasPathSum(tree, 0)
