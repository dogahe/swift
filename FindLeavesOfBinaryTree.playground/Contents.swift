/*
 366. Find Leaves of Binary Tree


 Given a binary tree. collect a tree's nodes as if you were doing this: Collect and remove all leaves. repeat until the tree is empty.

 Example:

 Input: [1,2,3,4,5]
 
       1
      / \
     2   3
    / \
   4   5

 Output: [[4,5,3],[2],[1]]

 Explanation:

 1. Removing the leaves [4,5,3] would result in this tree:
 
        1
       /
      2
 

 2. Now removing the leaf [2] would result in this tree
 
        1
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

func getLeaves(_ root: TreeNode?) -> [[Int]] {
    if root == nil {
        return []
    }
    var leaves: [[Int]] = []
    getHeight(root, &leaves)
    return leaves
}

func getHeight(_ node: TreeNode?, _ leaves: inout [[Int]]) -> Int {
    if node == nil {
        return 0
    }
    let height = max(getHeight(node!.left, &leaves), getHeight(node!.right, &leaves)) + 1
    if leaves.count < height {
        leaves.append([])
    }
    leaves[height - 1].append(node!.val)
    return height
}

let tree = TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3))
getLeaves(tree)

/*
 
             1
            /  \
           2    3
          / \    \
         4   5    6
 
 */

let tree2 = TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3, nil, TreeNode(6)))
getLeaves(tree2)
