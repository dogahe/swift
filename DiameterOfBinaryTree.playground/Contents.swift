/*
 
 tags:Google
 
 543. Diameter of Binary Tree
 
 Given the root of a binary tree, return the length of the diameter of the tree.

 The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.

 The length of a path between two nodes is represented by the number of edges between them.

  

 Example 1:
 
 Input: root = [1,2,3,4,5]
 Output: 3
 Explanation: 3is the length of the path [4,2,1,3] or [5,2,1,3].
 Example 2:

 Input: root = [1,2]
 Output: 1
  

 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 -100 <= Node.val <= 100
 
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


// Better Solution
func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    var diameter: Int = 0
    longestPath(root, &diameter)
    return diameter
}

func longestPath(_ node: TreeNode?, _ diameter: inout Int) -> Int {
    if node == nil {
        return 0
    }
    let leftDepth = longestPath(node!.left, &diameter)
    let rightDepth = longestPath(node!.right, &diameter)
    diameter = max(diameter, leftDepth + rightDepth)
    return 1 + max(leftDepth, rightDepth)
}



func diameterOfBinaryTree2(_ root: TreeNode?) -> Int {
    var maxVal: Int = 0
    helper(root, &maxVal)
    return maxVal
}

func helper(_ node: TreeNode?, _ maxVal: inout Int) {
    if node == nil {
        return
    }
    let leftDepth = depth(node!.left)
    let rightDepth = depth(node!.right)
    let diameter = leftDepth + rightDepth
    if diameter > maxVal {
        maxVal = diameter
    }
    helper(node!.left, &maxVal)
    helper(node!.right, &maxVal)
}

func depth(_ node: TreeNode?) -> Int {
    if node == nil {
        return 0
    }
    return 1 + max(depth(node!.left), depth(node!.right))
}





let tree1 = TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3))
diameterOfBinaryTree(tree1)

let tree2 = TreeNode(1, TreeNode(2), nil)
diameterOfBinaryTree(tree2)

let tree3 = TreeNode(1, TreeNode(3, TreeNode(4, TreeNode(6, TreeNode(8), nil), nil), TreeNode(5, nil, TreeNode(7, nil, TreeNode(8)))), TreeNode(2))
diameterOfBinaryTree(tree3)
