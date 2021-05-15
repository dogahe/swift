/*
 
 206. Reverse Linked List
 
 Given the head of a singly linked list, reverse the list, and return the reversed list.

 Example 1:
 Input: head = [1,2,3,4,5]
 Output: [5,4,3,2,1]
 
 Example 2:
 
 Input: head = [1,2]
 Output: [2,1]
 Example 3:

 Input: head = []
 Output: []
 
 Constraints:

 The number of nodes in the list is the range [0, 5000].
 -5000 <= Node.val <= 5000
  

 Follow up: A linked list can be reversed either iteratively or recursively. Could you implement both?
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

func reverseList(_ head: ListNode?) -> ListNode? {
    var curr: ListNode? = head
    var prev: ListNode? = nil
    while curr != nil {
        let next = curr!.next
        curr!.next = prev
        prev = curr
        curr = next
    }
    return prev
}


let values: [Int] = [1,2,3,4,5]
var list: ListNode? = nil
values.forEach { value in
    list = insertIntoList(list, value)
}
printList(list)

let r = reverseList(list)
printList(r)
