/*
 
 Intersection of Two Linked Lists
 
 Write a program to find the node at which the intersection of two singly linked lists begins.

 For example, the following two linked lists:


 begin to intersect at node c1.

  

 Example 1:


 Input: intersectVal = 8, listA = [4,1,8,4,5], listB = [5,6,1,8,4,5], skipA = 2, skipB = 3
 Output: Reference of the node with value = 8
 Input Explanation: The intersected node's value is 8 (note that this must not be 0 if the two lists intersect). From the head of A, it reads as [4,1,8,4,5]. From the head of B, it reads as [5,6,1,8,4,5]. There are 2 nodes before the intersected node in A; There are 3 nodes before the intersected node in B.
  

 Example 2:


 Input: intersectVal = 2, listA = [1,9,1,2,4], listB = [3,2,4], skipA = 3, skipB = 1
 Output: Reference of the node with value = 2
 Input Explanation: The intersected node's value is 2 (note that this must not be 0 if the two lists intersect). From the head of A, it reads as [1,9,1,2,4]. From the head of B, it reads as [3,2,4]. There are 3 nodes before the intersected node in A; There are 1 node before the intersected node in B.
  

 Example 3:


 Input: intersectVal = 0, listA = [2,6,4], listB = [1,5], skipA = 3, skipB = 2
 Output: null
 Input Explanation: From the head of A, it reads as [2,6,4]. From the head of B, it reads as [1,5]. Since the two lists do not intersect, intersectVal must be 0, while skipA and skipB can be arbitrary values.
 Explanation: The two lists do not intersect, so return null.
  

 Notes:

 If the two linked lists have no intersection at all, return null.
 The linked lists must retain their original structure after the function returns.
 You may assume there are no cycles anywhere in the entire linked structure.
 Each value on each linked list is in the range [1, 10^9].
 Your code should preferably run in O(n) time and use only O(1) memory.
 
 
 
 */
import Foundation

public class ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        if lhs.val == rhs.val && lhs.next == rhs.next {
            return true
        }
        return false
    }
    
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

// Method A
/*
func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    var curr: ListNode? = headA
    
    var lengthA: Int = 0
    var lengthB: Int = 0
    
    while curr != nil {
        lengthA += 1
        curr = curr?.next
    }
    
    curr = headB
    while curr != nil {
        lengthB += 1
        curr = curr?.next
    }
    
    var currA: ListNode? = headA
    var currB: ListNode? = headB
    
    var advance: Int = 0
    if lengthA > lengthB {
        advance = lengthA - lengthB
        while advance > 0 {
            currA = currA?.next
            advance -= 1
        }
    } else if lengthB > lengthA {
        advance = lengthB - lengthA
        while advance > 0 {
            currB = currB?.next
            advance -= 1
        }
    }
    
    while currA !== currB && currA != nil && currB != nil {
        currA = currA?.next
        currB = currB?.next
    }
    
    if currA == currB {
        return currA
    }
    return nil
}
*/

// Method B: More Elegant

func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    var a: ListNode? = headA
    var b: ListNode? = headB
    var aReachedEnd: Bool = false
    var bReachedEnd: Bool = false
    while a !== b {
        if a?.next == nil {
            if aReachedEnd {
                return nil
            }
            a = headB
            aReachedEnd = true
        } else {
            a = a?.next
        }
        if b?.next == nil {
            if bReachedEnd {
                return nil
            }
            b = headA
            bReachedEnd = true
        } else {
            b = b?.next
        }
    }
    return a
}

let common = ListNode(8, ListNode(4, ListNode(5)))

let listA = ListNode(4, ListNode(1, common))
let listB = ListNode(5, ListNode(6, ListNode(1, common)))

let a = getIntersectionNode(listA, listB)
print(a?.val)
