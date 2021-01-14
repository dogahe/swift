/*
 Remove Duplicates from Sorted List
 
 Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.

 Example 1:
 
 Input: head = [1,1,2]
 Output: [1,2]
 
 Input: head = [1,1,2,3,3]
 Output: [1,2,3]
  

 Constraints:

 The number of nodes in the list is in the range [0, 300].
 -100 <= Node.val <= 100
 The list is guaranteed to be sorted in ascending order.
 
 */
import Foundation


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    var prev = head
    var curr = head
    while curr != nil {
        if prev?.val != curr?.val {
            prev?.next = curr
            prev = curr
        }
        if curr?.next == nil && prev?.val == curr?.val {
            prev?.next = nil
        }
        curr = curr!.next
    }
    return head
}

func insertIntoList(_ head: ListNode?, _ val: Int) -> ListNode? {
    if head == nil {
        let node = ListNode(val)
        return node
    } else {
        var curr = head!
        while curr.next != nil {
            curr = curr.next!
        }
        curr.next = ListNode(val)
        return head
    }
}

func printList(_ head: ListNode?) {
    var curr = head
    print("START")
    while curr != nil {
        print(curr!.val)
        curr = curr?.next
    }
    print("END")
}

let arr = [1,2,3,3,4,4]
var list: ListNode? = nil
arr.forEach { value in
    list = insertIntoList(list, value)
}

let result = deleteDuplicates(list)
printList(result)


