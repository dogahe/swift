/*
 Add Two Numbers
 
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

  

 Example 1:
 
 
 Input: l1 = [2,4,3], l2 = [5,6,4]
 Output: [7,0,8]
 Explanation: 342 + 465 = 807.
 Example 2:

 Input: l1 = [0], l2 = [0]
 Output: [0]
 Example 3:

 Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 Output: [8,9,9,9,0,0,0,1]
  

 Constraints:

 The number of nodes in each linked list is in the range [1, 100].
 0 <= Node.val <= 9
 It is guaranteed that the list represents a number that does not have leading zeros.
 
 */
import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var n1 = l1
    var n2 = l2
    var n: ListNode? = nil
    var sum: ListNode? = nil
    var carry = 0
    while n1 != nil || n2 != nil {
        var val1 = 0
        var val2 = 0
        if n1 != nil {
            val1 = n1!.val
        }
        if n2 != nil {
            val2 = n2!.val
        }
        let val = val1 + val2 + carry
        if n == nil {
            sum = ListNode(val % 10)
            n = sum
        } else {
            n!.next = ListNode(val % 10)
            n = n!.next
        }
        carry = val / 10
        n1 = n1?.next
        n2 = n2?.next
    }
    if carry != 0 {
        n!.next = ListNode(carry)
    }
    return sum
}

var l1 = ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9)))))))
var l2 = ListNode(9, ListNode(9, ListNode(9, ListNode(9))))


let a = addTwoNumbers(l1, l2)
print(a)
