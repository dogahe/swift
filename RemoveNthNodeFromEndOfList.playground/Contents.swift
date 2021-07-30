/*
 
 tags:Google
 
 19. Remove Nth Node From End of List
 
 Given the head of a linked list, remove the nth node from the end of the list and return its head.

 Example 1:
 Input: head = [1,2,3,4,5], n = 2
 Output: [1,2,3,5]
 
 Example 2:
 Input: head = [1], n = 1
 Output: []
 
 Example 3:
 Input: head = [1,2], n = 1
 Output: [1]
  
 Constraints:

 The number of nodes in the list is sz.
 1 <= sz <= 30
 0 <= Node.val <= 100
 1 <= n <= sz
  

 Follow up: Could you do this in one pass?
 
 */


import Foundation

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

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    var count = 0
    var ahead: ListNode? = head
    var curr: ListNode? = nil
    while ahead?.next != nil {
        if count == n {
            curr = head
        }
        if curr != nil {
            curr = curr!.next
        }
        ahead = ahead?.next
        count += 1
    }
    if curr == nil {
        if count == n - 1 {
            return head?.next
        }
        if count == n {
            curr = head
            curr?.next = curr?.next?.next
            return head
        } else {
            return nil
        }
    }
    curr?.next = curr?.next?.next
    return head
}

// With dummy node
func removeNthFromEnd2(_ head: ListNode?, _ n: Int) -> ListNode? {
    let dummy: ListNode = ListNode(0)
    dummy.next = head
    var ahead: ListNode? = head
    var curr: ListNode? = dummy
    for _ in 0 ..< n {
        ahead = ahead?.next
    }
    while ahead != nil {
        ahead = ahead?.next
        curr = curr?.next
    }
    curr?.next = curr?.next?.next
    return dummy.next
}


let values: [Int] = [1, 2, 3]
var list: ListNode? = nil
values.forEach { value in
    list = insertIntoList(list, value)
}
printList(list)

let newList = removeNthFromEnd2(list, 3)
printList(newList)
