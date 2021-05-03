/*
662. Maximum Width of Binary Tree
 
 Given a binary tree, write a function to get the maximum width of the given tree. The maximum width of a tree is the maximum width among all levels.

 The width of one level is defined as the length between the end-nodes (the leftmost and right most non-null nodes in the level, where the null nodes between the end-nodes are also counted into the length calculation.

 It is guaranteed that the answer will in the range of 32-bit signed integer.

 Example 1:

 Input:

            1
          /   \
         3     2
        / \     \
       5   3     9

 Output: 4
 Explanation: The maximum width existing in the third level with the length 4 (5,3,null,9).
 Example 2:

 Input:

           1
          /
         3
        / \
       5   3

 Output: 2
 Explanation: The maximum width existing in the third level with the length 2 (5,3).
 Example 3:

 Input:

           1
          / \
         3   2
        /
       5

 Output: 2
 Explanation: The maximum width existing in the second level with the length 2 (3,2).
 Example 4:

 Input:

           1
          / \
         3   2
        /     \
       5       9
      /         \
     6           7
 Output: 8
 Explanation:The maximum width existing in the fourth level with the length 8 (6,null,null,null,null,null,null,7).
  

 Constraints:

 The given binary tree will have between 1 and 3000 nodes.

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

func widthOfBinaryTree(_ root: TreeNode?) -> Int {
    var levels: [[Int?]] = []
    helper(root, level: 0, &levels)
    print(levels)
    
    var cleanedLevels: [[Int?]] = []
    for level in levels {
        print("Start: \(level)")
        var levelCopy = level
        while Array(levelCopy.prefix(1)).first! == nil || Array(levelCopy.suffix(1)).first! == nil {
            if Array(levelCopy.prefix(1)).first! == nil {
                levelCopy.remove(at: 0)
            }
            if Array(levelCopy.suffix(1)).first! == nil {
                levelCopy.removeLast()
            }
            if levelCopy.isEmpty {
                break
            }
        }
        print("End: \(levelCopy)")
        cleanedLevels.append(levelCopy)
    }
    
    let lengths = cleanedLevels.map( { $0.count } )
    return lengths.max()!
    
    /*
    var maximum: Int = Int.min
    for level in levels {
        var started = false
        var count = 0
        for element in level {
            if element != nil && !started {
                started = true
            }
            if started {
                count += 1
            }
        }
        maximum = max(maximum, count)
    }
    return maximum
     */
}

func helper(_ node: TreeNode?, level: Int, _ levels: inout [[Int?]]) {
    if node != nil {
        if levels.count >= level + 1 {
            levels[level].append(node!.val)
        } else {
            levels.append([])
            levels[level].append(node!.val)
        }
        helper(node!.left, level: level + 1, &levels)
        helper(node!.right, level: level + 1, &levels)
    } else {
        if levels.count >= level + 1 {
            levels[level].append(nil)
        } else {
            levels.append([])
            levels[level] = [nil]
        }
    }
}

//let tree = TreeNode(1, TreeNode(3, TreeNode(5), TreeNode(3)), TreeNode(2, nil, TreeNode(9)))
//let tree = TreeNode(1, TreeNode(3, TreeNode(5), TreeNode(3)), nil)
let tree = TreeNode(1, TreeNode(3, TreeNode(5), nil), TreeNode(2))
//let tree = TreeNode(1, nil, TreeNode(3, TreeNode(2), TreeNode(5)))
widthOfBinaryTree(tree)
