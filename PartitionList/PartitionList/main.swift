//
//  main.swift
//  PartitionList
//
//  Created by Behzad Dogahe on 4/20/21.
//

/*
 86. Partition List
 
 Given the head of a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.

 You should preserve the original relative order of the nodes in each of the two partitions.

 Example 1:
 Input: head = [1,4,3,2,5,2], x = 3
 Output: [1,2,2,4,3,5]
 
 Example 2:
 Input: head = [2,1], x = 2
 Output: [1,2]
  

 Constraints:

 The number of nodes in the list is in the range [0, 200].
 -100 <= Node.val <= 100
 -200 <= x <= 200
 
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

func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
    var left: ListNode? = nil
    var lefthead: ListNode?
    var right: ListNode? = nil
    var righthead: ListNode?
    
    var curr: ListNode? = head
    while curr != nil {
        if curr!.val < x {
            if left == nil {
                left = curr
                lefthead = left
            } else {
                left!.next = curr
                left = left?.next
            }
        } else {
            if right == nil {
                right = curr
                righthead = right
            } else {
                right!.next = curr
                right = right?.next
            }
        }
        curr = curr?.next
    }
    if left == nil {
        return righthead
    }
    left?.next = righthead
    right?.next = nil
    return lefthead
}


let values: [Int] = [1,4,3,2,5,2]
var list: ListNode? = nil
values.forEach { value in
    list = insertIntoList(list, value)
}
printList(list)

let  p = partition(list, 10)
printList(p)


