/*

 113. Path Sum II
 
 Given the root of a binary tree and an integer targetSum, return all root-to-leaf paths where each path's sum equals targetSum.

 A leaf is a node with no children.

 Example 1:

 Input: root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
 Output: [[5,4,11,2],[5,8,4,5]]
 Example 2:
 
 Input: root = [1,2,3], targetSum = 5
 Output: []
 Example 3:

 Input: root = [1,2], targetSum = 0
 Output: []
  
 Constraints:

 The number of nodes in the tree is in the range [0, 5000].
 -1000 <= Node.val <= 1000
 -1000 <= targetSum <= 1000
 
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

func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
    if root == nil {
        return []
    }
    var results: [[Int]] = []
    helper(root, sum, [], &results)
    return results
}

func helper(_ node: TreeNode?, _ sum: Int, _ result: [Int] , _ results: inout [[Int]] ) {
    if node == nil {
        return
    }
    
    if node!.left == nil && node!.right == nil {
        if sum == node!.val {
            var newResult = result
            newResult.append(node!.val)
            results.append(newResult)
            return
        }
    }
    let val = node!.val
    var newResult = result
    newResult.append(node!.val)
    helper(node!.left, sum - val, newResult, &results)
    helper(node!.right, sum - val, newResult, &results)
}

let tree = TreeNode(1, TreeNode(2, TreeNode(3), TreeNode(1)), TreeNode(5))

pathSum(tree, 6)
