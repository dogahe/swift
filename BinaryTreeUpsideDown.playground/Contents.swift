/*
 156. Binary Tree Upside Down

 Given the root of a binary tree, turn the tree upside down and return new root.

 You can turn a binary tree upside down with the following steps:

 1. The original left child becomes the new root.
 2. The original root becomes the new right child.
 3. The original right child becomes the new left child.

     x                     y
   /  \     =>           /  \
  y    z                z    x
 
 The mentioned steps are done level by level, it is guaranteed that every node in the given tree has either 0 or 2 chidlren.
 
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

func printInOrder(_ node: TreeNode?) {
    if node == nil {
        return
    }
    printInOrder(node!.left)
    print(node!.val)
    printInOrder(node!.right)
}


func upsideDown(_ root: TreeNode?) -> TreeNode? {
    if root == nil {
        return nil
    }
    return helper(root)
}

func helper(_ node: TreeNode?) -> TreeNode? {
    if node!.left == nil {
        return node
    }
    let newRoot = helper(node!.left)
    node?.left?.left = node?.right
    node?.left?.right = node
    node?.left = nil
    node?.right = nil
    
    return newRoot
}

let tree = TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3))
printInOrder(tree)
let newTree = upsideDown(tree)
print("======")
printInOrder(newTree)
