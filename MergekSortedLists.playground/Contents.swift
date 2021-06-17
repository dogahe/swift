public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    var listsCopy = lists
    var result: ListNode? = nil
    var theresMore = true
    while theresMore {
        theresMore = false
        var minVal = Int.max
        var minIndex = -1
        for i in 0 ..< listsCopy.count {
            if listsCopy[i] != nil && listsCopy[i]!.val < minVal {
                theresMore = true
                minIndex = i
                minVal = listsCopy[i]!.val
            }
        }
        let minNode = ListNode(listsCopy[minIndex]!.val)
        listsCopy[minIndex] = listsCopy[minIndex]!.next
        if result == nil {
            result = minNode
        } else {
            result!.next = minNode
            result = result!.next
        }
    }
    return result
}

let l1 = ListNode(1, ListNode(4, ListNode(5)))
let l2 = ListNode(1, ListNode(3, ListNode(4)))
let l3 = ListNode(2, ListNode(6))
let lists = [l1, l2, l3]

let r = mergeKLists(lists)


