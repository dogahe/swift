// Insert into a Binary Search Tree
// http://cslibrary.stanford.edu/110/BinaryTrees.html

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

func printBST(_ root: TreeNode?) {
    if root == nil  {
        return
    }
    printBST(root?.left)
    print(root!.val)
    printBST(root?.right)
    
}

func insertIntoBST(_ root: inout TreeNode?, _ val: Int) -> TreeNode? {
    if let root = root {
        if val < root.val {
            root.left = insertIntoBST(&root.left, val)
        } else {
            root.right = insertIntoBST(&root.right, val)
        }
        return root
    } else {
        root = TreeNode(val)
        return root
    }
}

let values = [4,2,7,1,3]
let val = 5

var root: TreeNode? = nil

values.forEach { value in
    insertIntoBST(&root, value)
}
print("####")
printBST(root)



insertIntoBST(&root, val)
print("####")
printBST(root)
