/*

Unique Binary Search Trees II
 
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

func insert(_ val: Int, _ head: TreeNode?) -> TreeNode? {
    var curr: TreeNode? = head
    var prev: TreeNode? = nil
    while curr != nil {
        prev = curr
        if val < curr!.val {
            curr = curr!.left
        } else {
            curr = curr!.right
        }
    }
    if prev == nil {
        return TreeNode(val)
    }
    if val < prev!.val {
        prev?.left = TreeNode(val)
    } else {
        prev?.right = TreeNode(val)
    }
    return head
}

func createTree(_ arr: [Int]) -> TreeNode? {
    var tree: TreeNode? = nil
    for i in 0 ..< arr.count {
        let val = arr[i]
        tree = insert(val, tree)
    }
    return tree
}

func generateTrees(_ n: Int) -> [TreeNode?]{
    let arr = Array(1 ... n)
    let curr: [Int] = []
    var results: [[Int]] = []
    helper(curr, arr, n, &results)
    print(results)
    return results.map { createTree($0) }
}

func helper(_ curr: [Int], _ arr: [Int], _ n: Int, _ results: inout [[Int]]) {
    if curr.count == n {
        results.append(curr)
        return
    }
    for i in 0 ..< arr.count {
        var newCurr = curr
        newCurr.append(arr[i])
        var newArr = arr
        newArr.remove(at: i)
        helper(newCurr, newArr, n, &results)
    }
}

generateTrees(3)
