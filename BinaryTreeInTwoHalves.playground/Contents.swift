/*
 
 Check if removing an edge can divide a Binary Tree in two halves
 
 Given a Binary Tree, find if there exists an edge whose removal creates two trees of equal size.
 
 Input : root of following tree
            5
          /   \
        1      6
       /      /  \
      3      7    4
 Output : true
 Removing edge 5-6 creates two trees of equal size


 Input : root of following tree
            5
          /   \
        1      6
             /  \
            7    4
          /  \    \
         3    2    8
 Output : false
 There is no edge whose removal creates two trees
 of equal size.

 Examples:
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

func canSplit(_ root: TreeNode?) -> Bool {
    let beneath = nodesBeneath(root)
    if beneath % 2 != 0 {
      return false
    }
    let half = beneath / 2
    return helper(root, half)
}

func nodesBeneath(_ node: TreeNode?) -> Int {
    if node == nil {
        return 0
    }
    return 1 + nodesBeneath(node!.left) + nodesBeneath(node!.right)
}

func helper(_ node: TreeNode?, _ numNodes: Int) -> Bool {
    if node == nil {
        if numNodes == 0 {
            return true
        } else {
            return false
        }
    }
    let leftR = nodesBeneath(node!.left)
    let rightR = nodesBeneath(node!.right)
    
    if leftR == numNodes || rightR == numNodes {
        return true
    }
    return helper(node!.left, numNodes) || helper(node!.right, numNodes)
}

let tree = TreeNode(5, TreeNode(1, TreeNode(3), nil), TreeNode(6, TreeNode(7), TreeNode(4)))
print(canSplit(tree))
