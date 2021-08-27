/*
 
 tags:Facebook
 
 143. Reorder List
 
 You are given the head of a singly linked-list. The list can be represented as:

 L0 → L1 → … → Ln - 1 → Ln
 Reorder the list to be on the following form:

 L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …
 You may not modify the values in the list's nodes. Only nodes themselves may be changed.

 Example 1:
 Input: head = [1,2,3,4]
 Output: [1,4,2,3]
 
 Example 2:
 Input: head = [1,2,3,4,5]
 Output: [1,5,2,4,3]
  
 Constraints:

 The number of nodes in the list is in the range [1, 5 * 104].
 1 <= Node.val <= 1000
 
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
    var prev: ListNode? = nil
    while fast.next?.next != nil {
        fast = fast.next!.next!
        prev = slow
        slow = slow.next!
    }
    if fast.next != nil {
        prev = slow
        slow = slow.next!
    }
    prev?.next = nil
    return slow
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

func reorderList(_ head: inout ListNode?) {
    let m = middleNode(head)
    let reversed = reverseList(m)
    var n1: ListNode? = head
    var n2: ListNode? = reversed
    var outputHead: ListNode? = nil
    var output: ListNode? = nil
    var first: Bool = true
    while n1 != nil && n2 != nil {
        if first {
            if output == nil {
                output = n1
                outputHead = output
            } else {
                output?.next = n1
                output = output?.next
            }
            n1 = n1!.next
            first = false
        } else {
            output?.next = n2
            output = output?.next
            n2 = n2!.next
            first = true
        }
    }
    if n1 == nil {
        output?.next = n2
    } else {
        output?.next = n1
    }
    head = outputHead
}



let values: [Int] = [1,2,3,4,5]
var list: ListNode? = nil
values.forEach { value in
    list = insertIntoList(list, value)
}
printList(list)

reorderList(&list)
printList(list)

let values2: [Int] = [1,2,3,4]
var list2: ListNode? = nil
values2.forEach { value in
    list2 = insertIntoList(list2, value)
}
printList(list2)

reorderList(&list2)
printList(list2)
