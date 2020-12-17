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

func isValidBST(_ root: TreeNode?) -> Bool {
    helper(root, min: Int.min, max: Int.max)
}

func helper(_ node: TreeNode?, min: Int, max: Int) -> Bool {
    if node == nil {
        return true
    }
    if node!.val > min && node!.val < max {
        return helper(node!.left, min: min, max: node!.val) && helper(node!.right, min: node!.val, max: max)
    }
    return false
}

let root = TreeNode(2, TreeNode(3), TreeNode(5))

isValidBST(root)


