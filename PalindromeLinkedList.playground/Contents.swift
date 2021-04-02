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

func isPalindrome(_ head: ListNode?) -> Bool {
    var newList: ListNode? = nil
    var curr = head
    while curr != nil {
        let node = ListNode(curr!.val)
        node.next = newList
        newList = node
        curr = curr!.next
    }
    var curr1 = head
    var curr2 = newList
    while curr1 != nil {
        if curr1!.val != curr2!.val {
            return false
        }
        curr1 = curr1!.next
        curr2 = curr2!.next
    }
    return true
}

let values: [Int] = [1,2,3,2,1]
var list: ListNode? = nil
values.forEach { value in
    list = insertIntoList(list, value)
}
printList(list)

isPalindrome(list)
