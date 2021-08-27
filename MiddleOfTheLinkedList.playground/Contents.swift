/*
 
 876. Middle of the Linked List
 
 Given the head of a singly linked list, return the middle node of the linked list.

 If there are two middle nodes, return the second middle node.

 Example 1:
 Input: head = [1,2,3,4,5]
 Output: [3,4,5]
 Explanation: The middle node of the list is node 3.
 
 Example 2:
 Input: head = [1,2,3,4,5,6]
 Output: [4,5,6]
 Explanation: Since the list has two middle nodes with values 3 and 4, we return the second one.
  
 Constraints:
 The number of nodes in the list is in the range [1, 100].
 1 <= Node.val <= 100
 
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
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

func middleNode(_ head: ListNode?) -> ListNode? {
    if head == nil {
        return nil
    }
    if head!.next == nil {
        return head
    }
    var slow = head!
    var fast = head!
    while fast.next?.next != nil {
        fast = fast.next!.next!
        slow = slow.next!
    }
    if fast.next != nil {
        slow = slow.next!
    }
    return slow
}

let values: [Int] = [1,2,3,4,5]
var list: ListNode? = nil
values.forEach { value in
    list = insertIntoList(list, value)
}
printList(list)

let m = middleNode(list)
printList(m)

let values2: [Int] = [1,2,3,4,5,6]
var list2: ListNode? = nil
values2.forEach { value in
    list2 = insertIntoList(list2, value)
}
printList(list2)

let m2 = middleNode(list2)
printList(m2)
