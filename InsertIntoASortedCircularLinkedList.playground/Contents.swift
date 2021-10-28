
public class Node {
    public var val: Int
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func insert(_ head: Node?, _ insertVal: Int) -> Node? {
    if head == nil {
        let node = Node(insertVal)
        node.next = node
        return node
    }
    var node = head
    while true {
        if let val1 = node?.val, let val2 = node?.next?.val {
            if ((val2 > val1) && (insertVal >= val1 && insertVal < val2)) || val1 == val2 || val2 == head!.val || ((val1 > val2) && (insertVal >= val2 && insertVal < val1)) {
                // Insert here
                let n = node?.next
                let newNode = Node(insertVal)
                node?.next = newNode
                newNode.next = n
                return head
            } else {
                node = node?.next
            }
        }
    }
}



