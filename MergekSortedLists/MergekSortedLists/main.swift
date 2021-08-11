//
//  main.swift
//  MergekSortedLists
//
//  Created by Behzad Dogahe on 6/13/21.
//

/*
 
 tags:Google
 
 23. Merge k Sorted Lists
 
 You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.

 Merge all the linked-lists into one sorted linked-list and return it.

 Example 1:
 Input: lists = [[1,4,5],[1,3,4],[2,6]]
 Output: [1,1,2,3,4,4,5,6]
 Explanation: The linked-lists are:
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 merging them into one sorted list:
 1->1->2->3->4->4->5->6
 
 Example 2:
 Input: lists = []
 Output: []
 
 Example 3:
 Input: lists = [[]]
 Output: []
  
 Constraints:
 k == lists.length
 0 <= k <= 10^4
 0 <= lists[i].length <= 500
 -10^4 <= lists[i][j] <= 10^4
 lists[i] is sorted in ascending order.
 
 The sum of lists[i].length won't exceed 10^4.
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
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


func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    var listsCopy = lists
    var result: ListNode? = nil
    var resultHead: ListNode? = nil
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
        if minIndex > -1 {
            let minNode = ListNode(listsCopy[minIndex]!.val)
            listsCopy[minIndex] = listsCopy[minIndex]!.next
            if result == nil {
                result = minNode
                resultHead = minNode
            } else {
                result!.next = minNode
                result = result!.next
            }
        }
    }
    return resultHead
}

let l1 = ListNode(1, ListNode(4, ListNode(5)))
let l2 = ListNode(1, ListNode(3, ListNode(4)))
let l3 = ListNode(2, ListNode(6))
let lists = [l1, l2, l3]

let r = mergeKLists(lists)

printList(r)


