/*
 987. Vertical Order Traversal of a Binary Tree
 
 Given the root of a binary tree, calculate the vertical order traversal of the binary tree.

 For each node at position (row, col), its left and right children will be at positions (row + 1, col - 1) and (row + 1, col + 1) respectively. The root of the tree is at (0, 0).

 The vertical order traversal of a binary tree is a list of top-to-bottom orderings for each column index starting from the leftmost column and ending on the rightmost column. There may be multiple nodes in the same row and same column. In such a case, sort these nodes by their values.

 Return the vertical order traversal of the binary tree.

  

 Example 1:
 
 Input: root = [3,9,20,null,null,15,7]
 Output: [[9],[3,15],[20],[7]]
 Explanation:
 Column -1: Only node 9 is in this column.
 Column 0: Nodes 3 and 15 are in this column in that order from top to bottom.
 Column 1: Only node 20 is in this column.
 Column 2: Only node 7 is in this column.
 Example 2:
 
 Input: root = [1,2,3,4,5,6,7]
 Output: [[4],[2],[1,5,6],[3],[7]]
 Explanation:
 Column -2: Only node 4 is in this column.
 Column -1: Only node 2 is in this column.
 Column 0: Nodes 1, 5, and 6 are in this column.
           1 is at the top, so it comes first.
           5 and 6 are at the same position (2, 0), so we order them by their value, 5 before 6.
 Column 1: Only node 3 is in this column.
 Column 2: Only node 7 is in this column.
 Example 3:
 
 Input: root = [1,2,3,4,6,5,7]
 Output: [[4],[2],[1,5,6],[3],[7]]
 Explanation:
 This case is the exact same as example 2, but with nodes 5 and 6 swapped.
 Note that the solution remains the same since 5 and 6 are in the same location and should be ordered by their values.
  

 Constraints:

 The number of nodes in the tree is in the range [1, 1000].
 0 <= Node.val <= 1000
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


func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
    var result: [(Int, (Int, Int))] = []
    helper(root, 0, 0, &result)
    
    if let minColTuple = result.min(by: { $0.1.1 < $1.1.1 } ), let maxColTuple = result.min(by: { $0.1.1 > $1.1.1 } ) {
        let minCol = minColTuple.1.1
        let maxCol = maxColTuple.1.1
        var final: [[Int]] = []
        for col in minCol ... maxCol {
            let col = result.filter( { $0.1.1 == col } )
            let sortedCol = col.sorted(by: {
                if $0.1.0 < $1.1.0 {
                    return true
                } else if $0.1.0 > $1.1.0 {
                    return false
                } else {
                    return $0.0 < $1.0
                }
            } )
            final.append(sortedCol.map( { $0.0 } ))
        }
        return final
    }
    return []
}

func helper(_ node: TreeNode?, _ row: Int, _ col: Int, _ result: inout [(Int, (Int, Int))]) {
    if node == nil {
        return
    }
    result.append((node!.val, (row, col)))
    helper(node!.left, row + 1, col - 1, &result)
    helper(node!.right, row + 1, col + 1, &result)
}

let tree1 = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
verticalTraversal(tree1)

let tree2 = TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3, TreeNode(6), TreeNode(7)))
verticalTraversal(tree2)

let tree3 = TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(6)), TreeNode(3, TreeNode(5), TreeNode(7)))
verticalTraversal(tree3)
