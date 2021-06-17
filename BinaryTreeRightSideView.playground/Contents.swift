/*
 199. Binary Tree Right Side View

 Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

 Example 1:

 Input: root = [1,2,3,null,5,null,4]
 Output: [1,3,4]
 Example 2:

 Input: root = [1,null,3]
 Output: [1,3]
 Example 3:

 Input: root = []
 Output: []
  

 Constraints:

 The number of nodes in the tree is in the range [0, 100].
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


func rightSideView(_ root: TreeNode?) -> [Int] {
    var levels: [[Int]] = []
    helper(root, 0, &levels)
    print(levels)
    var output: [Int] = []
    for level in levels {
        output.append(level.last!)
    }
    return output
}

    func helper(_ node: TreeNode?, _ level: Int, _ levels: inout [[Int]]) {
        if node == nil {
            return
        }
        if levels.count == level {
            levels.append([])
        }
        levels[level].append(node!.val)
        helper(node!.left, level + 1, &levels)
        helper(node!.right, level + 1, &levels)
    }


let tree = TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3, TreeNode(6), TreeNode(7)))
let tree2 = TreeNode(1, TreeNode(2, nil, TreeNode(5)), TreeNode(3, nil, TreeNode(4)))

rightSideView(tree2)


