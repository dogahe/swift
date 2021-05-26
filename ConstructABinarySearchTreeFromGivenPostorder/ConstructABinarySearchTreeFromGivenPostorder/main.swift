//
//  main.swift
//  ConstructABinarySearchTreeFromGivenPostorder
//
//  Created by Behzad Dogahe on 5/23/21.
//

/*
 
 Construct a Binary Search Tree from given postorder
 
 Given postorder traversal of a binary search tree, construct the BST.

 For example, if the given traversal is {1, 7, 5, 50, 40, 10}, then following tree should be constructed and root of the tree should be returned.

      10
    /   \
   5     40
  /  \      \
 1    7      50
 
 Method 2 ( O(n) time complexity )
 The trick is to set a range {min .. max} for every node. Initialize the range as {INT_MIN .. INT_MAX}. The last node will definitely be in range, so create root node. To construct the left subtree, set the range as {INT_MIN …root->data}. If a values is in the range {INT_MIN .. root->data}, the values is part part of left subtree. To construct the right subtree, set the range as {root->data .. INT_MAX}.
 
 
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

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var result: [Int] = []
    inorderHelper(root, result: &result)
    return result
 }

func inorderHelper(_ node: TreeNode?, result: inout [Int]) {
    if node == nil {
        return
    }
    inorderHelper(node!.left, result: &result)
    result.append(node!.val)
    inorderHelper(node!.right, result: &result)
}

func constructTree(_ post: [Int], _ size: Int) -> TreeNode? {
    var postIndex: Int = size - 1
    return helper(post, &postIndex, post[postIndex], Int.min, Int.max, size)
}

func helper(_ post: [Int], _ postIndex: inout Int, _ key: Int, _ min: Int, _ max: Int, _ size: Int) -> TreeNode? {
    print(postIndex, post[postIndex], min, max)
    if postIndex < 0 {
        return nil
    }
    var root: TreeNode? = nil
    if key > min && key < max {
        root = TreeNode(key)
        postIndex -= 1
        if postIndex > 0 {
            root?.right = helper(post, &postIndex, post[postIndex], key, max, size)
            root?.left = helper(post, &postIndex, post[postIndex], min, key, size)
        }
    }
    return root
}

let post: [Int] = [1, 7, 5, 50, 40, 10]
let t = constructTree(post, post.count)
print(inorderTraversal(t))
