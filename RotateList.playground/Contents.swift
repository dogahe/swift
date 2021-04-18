/*
 
 Rotate List
 
 Given a linked list, rotate the list to the right by k places, where k is non-negative.
 
 Example 1:

 Input: 1->2->3->4->5->NULL, k = 2
 Output: 4->5->1->2->3->NULL
 Explanation:
 rotate 1 steps to the right: 5->1->2->3->4->NULL
 rotate 2 steps to the right: 4->5->1->2->3->NULL
 Example 2:

 Input: 0->1->2->NULL, k = 4
 Output: 2->0->1->NULL
 Explanation:
 rotate 1 steps to the right: 2->0->1->NULL
 rotate 2 steps to the right: 1->2->0->NULL
 rotate 3 steps to the right: 0->1->2->NULL
 rotate 4 steps to the right: 2->0->1->NULL
 
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


func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    if head == nil || head?.next == nil || k == 0 {
        return head
    }
    
    var size: Int = 0
    var curr = head
    while curr != nil {
        size += 1
        curr = curr!.next
    }
    
    let kk = k % size
    
    curr = head
    var i: Int = 0

    var last: ListNode? = nil
    while curr?.next != nil || last == nil {
        if last != nil {
            if last?.next == nil {
                last = head
            } else {
                last = last?.next
            }
        }
        if curr?.next == nil {
            curr = head
        } else {
            curr = curr?.next
        }
        i += 1
        if last == nil && i == kk {
            last = head
        }
    }
    if last?.next == nil {
        return head
    }
    let newHead = last?.next
    last?.next = nil
    var tail = newHead
    while tail?.next != nil {
        tail = tail?.next
    }
    tail?.next = head
    return newHead
}

let values: [Int] = [1,2]//[1, 2, 3]
var list: ListNode? = nil
values.forEach { value in
    list = insertIntoList(list, value)
}
printList(list)

let rotated = rotateRight(list, 2)
printList(rotated)


