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


let values: [Int] = [1, 2, 3]
var list: ListNode? = nil
values.forEach { value in
    list = insertIntoList(list, value)
}
printList(list)

let newList = removeNthFromEnd(list, 3)
printList(newList)
