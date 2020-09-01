/*
 Path Sum III
 You are given a binary tree in which each node contains an integer value.

 Find the number of paths that sum to a given value.

 The path does not need to start or end at the root or a leaf, but it must go downwards (traveling only from parent nodes to child nodes).

 The tree has no more than 1,000 nodes and the values are in the range -1,000,000 to 1,000,000.

 Example:
 
 root = [10,5,-3,3,2,null,11,3,-2,null,1], sum = 8

       10
      /  \
     5   -3
    / \    \
   3   2   11
  / \   \
 3  -2   1

 Return 3. The paths that sum to 8 are:

 1.  5 -> 3
 2.  5 -> 2 -> 1
 3. -3 -> 11

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
// http://cslibrary.stanford.edu/110/BinaryTrees.html
func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
    func pathSumRecursive(_ root: TreeNode?, _ sum: Int) -> Int {
        if let root = root {
            return (sum == root.val ? 1 : 0) + pathSumRecursive(root.left, sum - root.val) + pathSumRecursive(root.right, sum - root.val)
        } else {
            return 0
        }
    }
    
    if let root = root {
        return pathSumRecursive(root, sum) + pathSum(root.left, sum) + pathSum(root.right, sum)
    } else {
        return 0
    }
}
//let myTree: TreeNode = TreeNode(10, TreeNode(5, TreeNode(3, TreeNode(3), TreeNode(-2)), TreeNode(2, nil, TreeNode(1))), TreeNode(-3, nil, TreeNode(11)))
//let myTree: TreeNode = TreeNode(10, TreeNode(5), TreeNode(-3))
//let myTree: TreeNode = TreeNode(10, TreeNode(5, TreeNode(1), TreeNode(2)), TreeNode(-3, nil, TreeNode(9)))
let myTree: TreeNode = TreeNode(0, TreeNode(1), TreeNode(1))
pathSum(myTree, 1)
