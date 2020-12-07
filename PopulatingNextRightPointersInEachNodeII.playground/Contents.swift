/*
 Populating Next Right Pointers in Each Node II

 Given a binary tree

 struct Node {
   int val;
   Node *left;
   Node *right;
   Node *next;
 }
 
 Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.

 Initially, all next pointers are set to NULL.

  

 Follow up:

 You may only use constant extra space.
 Recursive approach is fine, you may assume implicit stack space does not count as extra space for this problem.
 Example 1:
 Input: root = [1,2,3,4,5,null,7]
 Output: [1,#,2,3,#,4,5,7,#]
 Explanation: Given the above binary tree (Figure A), your function should populate each next pointer to point to its next right node, just like in Figure B. The serialized output is in level order as connected by the next pointers, with '#' signifying the end of each level.
 Constraints:

 The number of nodes in the given tree is less than 6000.
 -100 <= node.val <= 100

 
 */
import Foundation

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

func connect(_ root: Node?) -> Node? {
    var q: [(Node?, Int)] = []
    q.append((root, 0))
    while !q.isEmpty {
        let (node, level) = q.removeFirst()
        if let nextNode = q.first {
            if nextNode.1 == level {
                node?.next = nextNode.0
            }
        }
        if node?.left != nil {
            q.append((node?.left, level + 1))
        }
        if node?.right != nil {
            q.append((node?.right, level + 1))
        }
    }
    return root
}


