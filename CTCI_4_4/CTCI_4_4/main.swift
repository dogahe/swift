//
//  main.swift
//  CTCI_4_4
//
//  Created by Behzad Dogahe on 5/23/21.
//

/*
 
 Given a binary tree, design an algorithm which creates a linked list of all the nodes at each depth (e.g., if you have a tree with depth D, you'll have D linked lists).
 
 
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

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode) { self.val = val; self.next = next; }

}


func createLinkedLists(_ root: TreeNode?) -> [ListNode] {
    var lists: [ListNode] = []
    helper(root, 0, &lists)
    return lists
}

func helper(_ node: TreeNode?, _ level: Int, _ lists: inout [ListNode]) {
    if node == nil {
        return
    }
    if lists.count == level {
        lists.append(ListNode(node!.val))
    } else {
        lists[level] = ListNode(node!.val,  lists[level])
    }
    helper(node!.left, level + 1, &lists)
    helper(node!.right, level + 1, &lists)
}

let tree = TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3))
let l = createLinkedLists(tree)
print(l)

