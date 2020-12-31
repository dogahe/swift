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

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var result: [Int] = []
    helper(root, result: &result)
    return result
 }

func helper(_ node: TreeNode?, result: inout [Int]) {
    if node == nil {
        return
    }
    helper(node!.left, result: &result)
    result.append(node!.val)
    helper(node!.right, result: &result)
}

func inorderTraversalIterative(_ root: TreeNode?) -> [Int] {
    var result: [Int] = []
    var stack: [TreeNode] = []
    var curr = root
    while curr != nil || !stack.isEmpty {
        while curr != nil {
            stack.append(curr!)
            curr = curr!.left
        }
        curr = stack.popLast()
        result.append(curr!.val)
        curr = curr!.right
    }
    return result
 }
