/*
 Insertion Sort List
 Sort a linked list using insertion sort.
 
 Algorithm of Insertion Sort:

 Insertion sort iterates, consuming one input element each repetition, and growing a sorted output list.
 At each iteration, insertion sort removes one element from the input data, finds the location it belongs within the sorted list, and inserts it there.
 It repeats until no input elements remain.

 Example 1:

 Input: 4->2->1->3
 Output: 1->2->3->4
 Example 2:

 Input: -1->5->3->4->0
 Output: -1->0->3->4->5
 
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

func insertInSortedOrder(_ head: ListNode?, _ val: Int) -> ListNode? {
    if head == nil {
        return ListNode(val)
    } else {
        if val <= head!.val {
            let newHead = ListNode(val, head)
            return newHead
        } else {
            var curr = head
            while curr?.next != nil && val > curr?.next?.val ?? (val + 1) {
                curr = curr?.next
            }
            let newNode = ListNode(val, curr?.next)
            curr?.next = newNode
            return head
        }
    }
}

func insertionSortList(_ head: ListNode?) -> ListNode? {
    var curr = head
    var sortedList: ListNode? = nil
    while curr != nil {
        sortedList = insertInSortedOrder(sortedList, curr!.val)
        curr = curr!.next
    }
    return sortedList
}

let values: [Int] = [-1,5,3,4,0]//[4,2,1,3,12,34,89,34,45,56]//
var list: ListNode? = nil
values.forEach { value in
    list = insertIntoList(list, value)
}
printList(list)

let sortedList = insertionSortList(list)
printList(sortedList)
