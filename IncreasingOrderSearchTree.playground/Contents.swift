/*
 Increasing Order Search Tree
 
 Given the root of a binary search tree, rearrange the tree in in-order so that the leftmost node in the tree is now the root of the tree, and every node has no left child and only one right child.

 Example 1:
 
 Input: root = [5,3,6,2,4,null,8,1,null,null,null,7,9]
 Output: [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9]
 
 Input: root = [5,1,7]
 Output: [1,null,5,null,7]
 
 Constraints:

 The number of nodes in the given tree will be in the range [1, 100].
 0 <= Node.val <= 1000
 
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

func increasingBST(_ root: TreeNode?) -> TreeNode? {
    var newNode: TreeNode? = nil
    helper(root, &newNode)
    return newNode
}

func helper(_ node: TreeNode?, _ constructed: inout TreeNode?) {
    if node == nil  {
        return
    }
    helper(node!.left, &constructed)
    if constructed == nil {
        constructed = TreeNode(node!.val)
    } else {
        var rightNode = constructed
        while rightNode?.right != nil {
            rightNode = rightNode?.right
        }
        rightNode?.right = TreeNode(node!.val)
    }
    helper(node!.right, &constructed)
}

func printTree(_ root: TreeNode?) {
    var node = root
    while node != nil {
        print(node!.val)
        node = node!.right
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


let r = TreeNode(10, TreeNode(8, TreeNode(6), TreeNode(9)), TreeNode(16))  //TreeNode(5, TreeNode(3, TreeNode(2, TreeNode(1), nil),  TreeNode(4)), TreeNode(6, nil, TreeNode(8, TreeNode(7), TreeNode(9))))

printInOrder(r)

let inc = increasingBST(r)

print("-----")
printInOrder(inc)
