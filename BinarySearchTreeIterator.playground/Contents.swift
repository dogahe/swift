
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



// Optimized Solution
class BSTIterator {

    var stack: [TreeNode]
    init(_ root: TreeNode?) {
        stack = []
        if root != nil {
            pushLeft(root!)
        }
    }
    
    func next() -> Int {
        let last = stack.removeLast()
        if last.right != nil {
            pushLeft(last.right!)
        }
        return last.val
    }
    
    func hasNext() -> Bool {
        return !stack.isEmpty
    }
    
    func pushLeft(_ node: TreeNode) {
        var curr: TreeNode? = node
        while curr != nil {
            stack.append(curr!)
            curr = curr!.left
        }
    }
}

// None Optimized
/*
class BSTIterator {

    var arr: [TreeNode]
    var currIndex: Int
    init(_ root: TreeNode?) {
        arr = []
        currIndex = 0
        if root != nil {
            inorder(root!)
        }
    }
    
    func next() -> Int {
        let node = arr[currIndex]
        currIndex += 1
        return node.val
    }
    
    func hasNext() -> Bool {
        return currIndex != arr.count
    }
    
    func inorder(_ root: TreeNode) {
        helper(root)
    }
    
    func helper(_ node: TreeNode?) {
        if node == nil {
            return
        }
        helper(node!.left)
        arr.append(node!)
        helper(node!.right)
    }
}
*/

let tree = TreeNode(7, TreeNode(3), TreeNode(15, TreeNode(9), TreeNode(20)))

let it = BSTIterator(tree)
it.next()
it.next()
it.hasNext()
it.next()
it.hasNext()
it.next()
it.hasNext()
it.next()
it.hasNext()

