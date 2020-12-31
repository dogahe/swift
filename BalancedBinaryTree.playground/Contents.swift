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

func isBalanced(_ root: TreeNode?) -> Bool {
    if root == nil {
        return true
    }
    let l = treeLength(root!.left)
    let r = treeLength(root!.right)
    if abs(l - r) <= 1 && isBalanced(root!.left) && isBalanced(root!.right) {
        return true
    } else {
        return false
    }
}

func treeLength(_ node: TreeNode?) -> Int {
    if node == nil {
        return 0
    }
    return 1 + max(treeLength(node!.left), treeLength(node!.right))
}

