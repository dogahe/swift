
/*
 
 tags:Google
 
 222. Count Complete Tree Nodes
 
 Given the root of a complete binary tree, return the number of the nodes in the tree.

 According to Wikipedia, every level, except possibly the last, is completely filled in a complete binary tree, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.

 Design an algorithm that runs in less than O(n) time complexity.

  

 Example 1:
 
 Input: root = [1,2,3,4,5,6]
 Output: 6
 Example 2:

 Input: root = []
 Output: 0
 Example 3:

 Input: root = [1]
 Output: 1
  

 Constraints:

 The number of nodes in the tree is in the range [0, 5 * 104].
 0 <= Node.val <= 5 * 104
 The tree is guaranteed to be complete.
 
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

func countNodes(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    return 1 + countNodes(root!.left) + countNodes(root!.right)
}

func getDepth(_ root: TreeNode) -> Int {
    var d = 0
    var node = root
    while node.left != nil {
        node = node.left!
        d += 1
    }
    return d
}

// Last level nodes are enumerated from 0 to 2**d - 1 (left -> right).
// Return True if last level node idx exists.
// Binary search with O(d) complexity.

func exists(_ d: Int, _ index: Int, _ root: TreeNode) -> Bool {
    var node: TreeNode? = root
    var left = 0
    var right = Int(pow(2.0, Double(d))) - 1
    var mid: Int
    for _ in 0 ..< d {
        mid = left + (right - left)/2
        if index <= mid {
            node = node!.left
            right = mid - 1
        } else {
            node = node!.right
            left = mid + 1
        }
    }
    return node != nil
}

func countNodesFast(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    let d = getDepth(root!)
    if d == 0 {
        return 1
    }
    
    // Last level nodes are enumerated from 0 to 2^d - 1 (left -> right). Perform binary search to check how many nodes exist.
    var left = 1
    var right = Int(pow(2.0, Double(d))) - 1
    while left <= right {
        let mid = left + (right - left)/2
        if exists(d, mid, root!) {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return Int(pow(2.0, Double(d))) - 1 + left
}


let tree = TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3, TreeNode(6), nil))
countNodes(tree)
countNodesFast(tree)
