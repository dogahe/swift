//
//  main.swift
//  ReverseLinkedListII
//
//  Created by Behzad Dogahe on 4/30/21.
//

/*
 
 92. Reverse Linked List II
 
 Given the head of a singly linked list and two integers left and right where left <= right, reverse the nodes of the list from position left to position right, and return the reversed list.

  

 Example 1:
 
 Input: head = [1,2,3,4,5], left = 2, right = 4
 Output: [1,4,3,2,5]
 Example 2:

 Input: head = [5], left = 1, right = 1
 Output: [5]
  

 Constraints:

 The number of nodes in the list is n.
 1 <= n <= 500
 -500 <= Node.val <= 500
 1 <= left <= right <= n
  

 Follow up: Could you do it in one pass?
 
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

func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
    var curr = head
    var prev: ListNode? = nil
    var index: Int = 1
    while index != left {
        if curr == nil {
            break
        }
        prev = curr
        curr = curr?.next
        index += 1
    }
    if curr == nil {
        return head
    }
    let finalPrev = prev
    let tail = curr
    prev = nil
    var next: ListNode? = nil
    while index != right {
        next = curr?.next
        curr?.next = prev
        prev = curr
        curr = next
        index += 1
    }
    next = curr?.next
    curr?.next = prev
    finalPrev?.next = curr
    tail?.next = next
    if finalPrev == nil {
        return curr
    }
    return head
}

let values: [Int] = [1,2,3,4,5]//[3, 5]//[-1,5,3,4,0]
var list: ListNode? = nil
values.forEach { value in
    list = insertIntoList(list, value)
}
printList(list)

let r = reverseBetween(list, 2, 4)
printList(r)
