/*
 
 tags:Google
 tags:Facebook
 
 Merge Two Sorted Lists
 
 Merge two sorted linked lists and return it as a sorted list. The list should be made by splicing together the nodes of the first two lists.

 Example 1:
 Input: l1 = [1,2,4], l2 = [1,3,4]
 Output: [1,1,2,3,4,4]
 
 Example 2:
 Input: l1 = [], l2 = []
 Output: []
 
 Example 3:
 Input: l1 = [], l2 = [0]
 Output: [0]
  
 Constraints:
 
 The number of nodes in both lists is in the range [0, 50].
 -100 <= Node.val <= 100
 Both l1 and l2 are sorted in non-decreasing order.
 
 */
import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var n1 = l1
    var n2 = l2
    
    let head: ListNode? = ListNode(0)
    var curr: ListNode? = head
    
    while n1 != nil && n2 != nil {
        if n1!.val <= n2!.val {
            curr!.next = n1
            curr = n1
            n1 = n1!.next
        } else {
            curr!.next = n2
            curr = n2
            n2 = n2!.next
        }
    }
    if n1 != nil {
        curr!.next = n1
    } else {
        curr!.next = n2
    }
    return head!.next
}
