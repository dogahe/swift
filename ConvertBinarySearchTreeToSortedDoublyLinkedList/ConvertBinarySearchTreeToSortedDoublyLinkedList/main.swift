//
//  main.swift
//  ConvertBinarySearchTreeToSortedDoublyLinkedList
//
//  Created by Behzad Dogahe on 9/1/21.
//

/*
 
 tags: Facebook
 
 426. Convert Binary Search Tree to Sorted Doubly Linked List
 
 Convert a Binary Search Tree to a sorted Circular Doubly-Linked List in place.

 You can think of the left and right pointers as synonymous to the predecessor and successor pointers in a doubly-linked list. For a circular doubly linked list, the predecessor of the first element is the last element, and the successor of the last element is the first element.

 We want to do the transformation in place. After the transformation, the left pointer of the tree node should point to its predecessor, and the right pointer should point to its successor. You should return the pointer to the smallest element of the linked list.

  

 Example 1:
 Input: root = [4,2,5,1,3]
 Output: [1,2,3,4,5]

 Explanation: The figure below shows the transformed BST. The solid line indicates the successor relationship, while the dashed line means the predecessor relationship.

 Example 2:
 Input: root = [2,1,3]
 Output: [1,2,3]
 
 Example 3:
 Input: root = []
 Output: []
 Explanation: Input is an empty tree. Output is also an empty Linked List.
 
 Example 4:
 Input: root = [1]
 Output: [1]
  
 Constraints:

 The number of nodes in the tree is in the range [0, 2000].
 -1000 <= Node.val <= 1000
 All the values of the tree are unique.

 */

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int, _ left: Node, _ right: Node) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func treeToDoublyList(_ root: Node?) -> Node? {
    let a = helper(root)
    a.0?.left = a.1
    a.1?.right = a.0
    return a.0
}

func helper(_ node: Node?) -> (Node?, Node?) {
    if node?.left == nil && node?.right == nil {
        return (node, node)
    }
    
    var leftSide: (Node?, Node?)?
    var rightSide: (Node?, Node?)?
    if node?.left != nil {
        leftSide = helper(node?.left)
    }
    if node?.right != nil {
        rightSide = helper(node?.right)
    }
    
    if leftSide != nil {
        leftSide!.1?.right = node
        node?.left = leftSide!.1
    }
    
    if rightSide != nil {
        rightSide!.0?.left = node
        node?.right = rightSide!.0
    }
    
    if leftSide == nil {
        return (node, rightSide?.1)
    }
    
    if rightSide == nil {
        return (leftSide?.0, node)
    }
    
    return (leftSide!.0,  rightSide!.1)
}

let t = Node(4, Node(2, Node(1), Node(3)), Node(5))
let a = treeToDoublyList(t)

print(a)

