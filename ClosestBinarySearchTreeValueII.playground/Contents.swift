/*
 272. Closest Binary Search Tree Value II

 Given a non-empty binary search tree and a target value, find k values in the BST that are closest to the target.

 Note:

 • Given target value is a floating point.

 • You may assume k is aslways valid, that is: ks total nodes.

 • You are guaranteed to have only one unique set of k values in the BST that are closest to the target.

 Example:

 Input: root = [4,2,5,1,3], target 3.714286, and k = 2

 Output: [4,3]

 Follow up:

 Assume that the BST is balanced, could you solve it in less than O(n)

 runtime (where n = total nodes)?
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

func closestKValues(_ root: TreeNode, _ target: Float, _ k: Int) -> [Int] {
    var queue: [Int] = []
    helper(root, &queue, target, k)
    return queue
}

func helper(_ node: TreeNode?, _ queue: inout [Int], _ target: Float, _ k: Int) {
    if node == nil {
        return
    }
    helper(node!.left, &queue, target, k)
    if queue.count == k {
        if let first = queue.first {
            if abs(target - Float(node!.val)) < abs(target - Float(first)) {
                queue.removeFirst()
            } else {
                return
            }
        }
    }
    queue.append(node!.val)
    print(queue)
    helper(node!.right, &queue, target, k)
}

let tree = TreeNode(4, TreeNode(2, TreeNode(1), TreeNode(3)), TreeNode(5))
closestKValues(tree, 3.71, 2)

