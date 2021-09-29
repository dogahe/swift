/*
 
 tags:Facebook
 
 270. Closest Binary Search Tree Value
 
 Given a non-empty binary search tree and a target value, find the value in the BST that is closest to the target.
 
 Note:
 
 • Given target value is a floating point.
 
 • You are guaranteed to have only one unique value in the BST that is closest to the target.
 
 Example:
 
 Input: root = [4,2,5,1,3], target 3.714286
 
 Output: 4

 Also:
 https://www.geeksforgeeks.org/find-closest-element-binary-search-tree/
 
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

func closestValue(_ root: TreeNode, _ target: Double) -> Int {
    var closest: Int?
    helper(root, &closest, target)
    return closest!
}

func helper(_ node: TreeNode?, _ closest: inout Int?, _ target: Double) {
    if node == nil {
        return
    }
    if closest != nil {
        if abs(target - Double(node!.val)) < abs(target - Double(closest!)) {
            closest = node!.val
        }
    } else {
        closest = node!.val
    }
    if target < Double(node!.val) {
        helper(node!.left, &closest, target)
    } else {
        helper(node!.right, &closest, target)
    }
}

//let tree = TreeNode(4, TreeNode(2, TreeNode(1), TreeNode(3)), TreeNode(5))
let tree = TreeNode(9, TreeNode(4, TreeNode(3), TreeNode(6, TreeNode(5), TreeNode(7))), TreeNode(17, nil, TreeNode(22, TreeNode(20), nil)))
closestValue(tree, 12)


