/*
 
 Sort List
 Given the head of a linked list, return the list after sorting it in ascending order.

 Follow up: Can you sort the linked list in O(n logn) time and O(1) memory (i.e. constant space)?

 Example 1:
 Input: head = [4,2,1,3]
 Output: [1,2,3,4]
 
 Example 2:
 Input: head = [-1,5,3,4,0]
 Output: [-1,0,3,4,5]
 
 Example 3:

 Input: head = []
 Output: []
  

 Constraints:

 The number of nodes in the list is in the range [0, 5 * 10^4].
 -10^5 <= Node.val <= 10^5


 
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

func sortList(_ head: ListNode?) -> ListNode? {
    var curr = head
    var sortedList: ListNode? = nil
    while curr != nil {
        sortedList = insertInSortedOrder(sortedList, curr!.val)
        curr = curr!.next
    }
    return sortedList
}

func merge(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    let dummyHead: ListNode = ListNode(0)
    var curr: ListNode? = dummyHead
    var currList1 = list1
    var currList2 = list2
    while currList1 != nil && currList2 != nil {
        if currList1!.val < currList2!.val {
            curr!.next = currList1
            currList1 = currList1!.next
        } else {
            curr!.next = currList2
            currList2 = currList2!.next
        }
        curr = curr!.next
    }
    if currList1 != nil {
        curr?.next = currList1
    } else {
        curr?.next = currList2
    }
    return dummyHead.next
}

func getMiddle(_ head: ListNode?) -> ListNode? {
    var midPrev: ListNode?
    var curr = head
    while curr != nil && curr?.next != nil {
        midPrev = midPrev == nil ? head : midPrev?.next
        curr = curr?.next?.next
    }
    let mid = midPrev?.next
    midPrev?.next = nil
    return mid
}

func mergeSortList(_ head: ListNode?) -> ListNode? {
    if  head == nil || head?.next == nil {
        return head
    }
    let mid = getMiddle(head)
    let left = mergeSortList(head)
    let right = mergeSortList(mid)
    return merge(left, right)
}

// TODO: Bottom Up Merge Sort
// https://leetcode.com/problems/sort-list/solution/

let values: [Int] = [4,2,1,3,12,34,89,34,45,56]//[-1,5,3,4,0]
var list: ListNode? = nil
values.forEach { value in
    list = insertIntoList(list, value)
}
printList(list)

let sortedList = sortList(list)
printList(sortedList)


printList(list)
let mergeSortedList = mergeSortList(list)
printList(mergeSortedList)
