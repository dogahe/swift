/*
 Remove Duplicates from Sorted List II
 
 Given the head of a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list. Return the linked list sorted as well.

 Input: head = [1,2,3,3,4,4,5]
 Output: [1,2,5]
 
 Input: head = [1,1,1,2,3]
 Output: [2,3]
 
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

func deleteDuplicatesBetterSolution(_ head: ListNode?) -> ListNode? {
    let dummy = ListNode(0, head)
    var prev = dummy
    var curr = head
    while curr != nil {
        if curr!.next != nil && curr!.val == curr!.next!.val {
            while curr!.next != nil && curr!.val == curr!.next!.val {
                curr = curr!.next
            }
            prev.next = curr!.next
        } else {
            prev = prev.next!
        }
        curr = curr!.next
    }
    return dummy.next
}

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    var curr = head
    var arr: [(Int, Int)] = []
    while curr != nil {
        if arr.count == 0 {
            arr.append((curr!.val, 1))
        } else {
            if arr.last!.0 == curr!.val {
                arr[arr.count - 1].1 +=  1
            } else {
                arr.append((curr!.val, 1))
            }
        }
        curr = curr!.next
    }
    var newHead: ListNode?
    arr.forEach { element in
        if element.1 == 1 {
            if newHead == nil {
                newHead = ListNode(element.0)
                curr = newHead
            } else {
                curr?.next = ListNode(element.0)
                curr = curr?.next
            }
        }
    }
    return newHead
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

let arr = [1,2,3,3,4,4,5]
var list: ListNode? = nil
arr.forEach { value in
    list = insertIntoList(list, value)
}

//let result = deleteDuplicates(list)
let result = deleteDuplicatesBetterSolution(list)

printList(result)


