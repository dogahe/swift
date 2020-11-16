/*
 https://www.geeksforgeeks.org/level-order-tree-traversal/
 
 Level order traversal of a tree is breadth first traversal for the tree.
 
                     1
                   /   \
                  2     3
                 / \
                4   5
 
 Level order traversal of the above tree is 1 2 3 4 5
                    
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

func height(_ node: TreeNode?) -> Int {
    if node == nil {
        return 0
    }
    let lHeight = height(node!.left)
    let rHeight = height(node!.right)
    if lHeight > rHeight {
        return lHeight + 1
    } else {
        return rHeight + 1
    }
}

func printLevelOrder(_ root: TreeNode?) {
    for level in 0 ..< height(root) {
        printGivenLevel(root, level: level)
    }
}

func printGivenLevel(_ node: TreeNode?, level: Int) {
    if node == nil {
        return
    }
    if level == 0 {
        print(node!.val)
    } else {
        printGivenLevel(node!.left, level: level - 1)
        printGivenLevel(node!.right, level: level - 1)
    }
}

func printLevelOrderWithQueue(_ root: TreeNode?) {
    if root == nil {
        return
    }
    var queue: [TreeNode] = []
    queue.append(root!)
    while !queue.isEmpty {
        let node = queue.first
        print(node?.val)
        queue.remove(at: 0)
        
        if node!.left != nil {
            queue.append(node!.left!)
        }
        if node!.right != nil {
            queue.append(node!.right!)
        }
    }
}

let myTree: TreeNode = TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3))

printLevelOrder(myTree)
printLevelOrderWithQueue(myTree)
