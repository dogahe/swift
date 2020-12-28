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

func swapPairs(_ head: ListNode?) -> ListNode? {
    var prev: ListNode? = nil
    var f: ListNode? = head
    var s: ListNode? = head?.next
    let newHead: ListNode? = s
    while f != nil && s != nil {
        f?.next = s?.next
        s?.next = f
        prev?.next = s
        prev = f
        f = f?.next
        s = f?.next
    }
    if newHead != nil {
        return newHead
    } else {
        return head
    }
}

let values: [Int] = [1,2,3,4]
var list: ListNode? = nil
values.forEach { value in
    list = insertIntoList(list, value)
}
printList(list)

var sp = swapPairs(list)
printList(sp)
