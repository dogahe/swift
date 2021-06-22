/*
 Intro
 
 N-ary tree is a tree, where each node can have N number of nodes.
 (V) is a node where V = value of the node.
 
       (4)
      / | \
   (1) (5) (6)
   /
 (3)
 
 Preliminary
 Construct a tree object model in whatever language you choose. Make sure it supports a value field and ability to traverse (i.e. nextNode).
 
 Next, write a print function that traverses the tree via Depth First Search. For example, printing the above tree will result in: 4, 1, 3, 5, 6.
 
 Question 1
 Calculate the total value, i.e. the sum of all nodes in the N-Ary tree. For example, the total value of the example (above) is 19.
 
 Question 2
 Compute the maximum branch value. For example, the maximum branch value of the example (below) is (4) + (5) + (15) = 24
 
         (4)
       /  |  \
    (1)  (5)  (6)
   /    / | \
 (3) (10)(15)(1)
 
 Question 3
 Return the nodes of the maximum branch. For example, the nodes to be returned in the example (above) would be [4, 5, 15].
 * [execution time limit] 5 seconds (swift)

 */

struct TreeNode {
    let value: Int
    let nextNodes: [TreeNode]?
    
    init(value: Int, nextNodes: [TreeNode]) {
        self.value = value
        self.nextNodes = nextNodes
    }
    
    init(value: Int) {
        self.value = value
        self.nextNodes = nil
    }
}

func dfs(root: TreeNode) {
    helper(root)
}

func helper(_ node: TreeNode?) {
    if node == nil {
        return
    }
    print(node!.value)
    if let children = node!.nextNodes {
        for child in children {
            helper(child)
        }
    }
}

func sum(root: TreeNode) -> Int {
    var sum: Int = 0
    helperSum(root, &sum)
    return sum
}

func helperSum(_ node: TreeNode?, _ sum: inout Int) {
    if node == nil {
        return
    }
    sum += node!.value
    if let children = node!.nextNodes {
        for child in children {
            helperSum(child, &sum)
        }
    }
}

func maxSum(root: TreeNode) -> Int {
    var currMax: Int = Int.min
    helperMaxSum(root, 0, &currMax)
    return currMax
}

func helperMaxSum(_ node: TreeNode?, _ sum: Int,  _ currMax: inout Int) {
    if node == nil {
        return
    }
    if let children = node!.nextNodes {
        for child in children {
            helperMaxSum(child, sum + node!.value, &currMax)
        }
    } else {
        currMax = max(currMax, sum + node!.value)
    }
}

func maxSumPath(root: TreeNode) -> [Int] {
    var currMax: Int = Int.min
    var maxPath: [Int] = []
    helperMaxSumPath(root, 0, [], &currMax, &maxPath)
    return maxPath
}

func helperMaxSumPath(_ node: TreeNode?, _ sum: Int, _ path: [Int], _ currMax: inout Int, _ maxPath: inout [Int]) {
    if node == nil {
        return
    }
    if let children = node!.nextNodes {
        for child in children {
            var newPath = path
            newPath.append(node!.value)
            helperMaxSumPath(child, sum + node!.value, newPath, &currMax, &maxPath)
        }
    } else {
        if sum + node!.value > currMax {
            currMax = sum + node!.value
            var newPath = path
            newPath.append(node!.value)
            maxPath = newPath
        }
    }
}

let tree11 = TreeNode(value: 1, nextNodes: [TreeNode(value: 3)])
let tree1 = TreeNode(value: 4, nextNodes: [tree11, TreeNode(value: 5), TreeNode(value: 6)])

let tree21 = TreeNode(value: 5, nextNodes: [TreeNode(value: 10), TreeNode(value: 15), TreeNode(value: 1)])
let tree2 = TreeNode(value: 4, nextNodes: [tree11, tree21, TreeNode(value: 6)])

print("=== dfs tree 1 ===")
dfs(root: tree1)
let add1 = sum(root: tree1)
print("sum: \(add1)")
let maxsum1 = maxSum(root: tree1)
print("max sum: \(maxsum1)")
let maxSumPath1 = maxSumPath(root: tree1)
print("max sum path: \(maxSumPath1)")
print("======")
print("=== dfs tree 2 ===")
dfs(root: tree2)
let add2 = sum(root: tree2)
print("sum: \(add2)")
let maxsum2 = maxSum(root: tree2)
print("max sum: \(maxsum2)")
let maxSumPath2 = maxSumPath(root: tree2)
print("max sum path: \(maxSumPath2)")
print("======")
