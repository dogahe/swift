/*
 tags:Facebook
 
 Reverse Operations
 You are given a singly-linked list that contains N integers. A subpart of the list is a contiguous set of even elements, bordered either by either end of the list or an odd element. For example, if the list is [1, 2, 8, 9, 12, 16], the subparts of the list are [2, 8] and [12, 16].
 Then, for each subpart, the order of the elements is reversed. In the example, this would result in the new list, [1, 8, 2, 9, 16, 12].
 The goal of this question is: given a resulting list, determine the original order of the elements.
 Implementation detail:
 You must use the following definition for elements in the linked list:
 class Node {
     int data;
     Node next;
 }
 Signature
 Node reverse(Node head)
 Constraints
 1 <= N <= 1000, where N is the size of the list
 1 <= Li <= 10^9, where Li is the ith element of the list
 Example
 Input:
 N = 6
 list = [1, 2, 8, 9, 12, 16]
 Output:
 [1, 8, 2, 9, 16, 12]
 
 */

import Foundation
// Add any extra import statements you may need here


// Add any helper functions you may need here


class Node {
  var data: Int
  var nextNode: Node?
    
  init(data: Int, next: Node? = nil) {
    self.data = data
    self.nextNode = next
  }
}

private extension Node {
  func reverse() -> Node {
    var prevEven: Node? = nil
    var next: Node? = nil
    var prev: Node? = nil
    let dummy = Node(data: 1)
    dummy.nextNode = self
    var curr: Node? = dummy
    while curr !=  nil {
        next = curr!.nextNode
        if curr!.data % 2 == 1 {
            if prevEven == nil {
                prev = curr
            } else {
                prev!.nextNode!.nextNode = curr
                prev!.nextNode = prevEven
                prevEven = nil
                prev = curr
            }
        } else {
            if prevEven == nil {
                prevEven = curr
            } else {
                curr!.nextNode = prevEven
                prevEven = curr
            }
        }
        curr = next
    }
    if prevEven != nil {
        prev?.nextNode?.nextNode = nil
        prev!.nextNode = prevEven
    }
    return dummy.nextNode!
  }
}


// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom.

struct NodeView: IteratorProtocol {
  var node: Node?
  mutating func next() -> Int? {
    defer { node = node?.nextNode }
    return node?.data
  }
}
 
extension Node: Sequence {
  typealias Element = Int
  func makeIterator() -> NodeView {
    return NodeView(node: self)
  }
}

private extension Node {
  static func from(array: [Int]) -> Node {
    var array = array
    var tail = Node(data: array.removeLast())
    for num in array.reversed() {
      tail = Node(data: num, next: tail)
    }
    return tail
  }
}

extension Node: Equatable {
  static func == (lhs: Node, rhs: Node) -> Bool {
    return Array(lhs) == Array(rhs)
  }
}

var testCaseNumber = 1

func check(_ expectedHead: Node, matches outputHead: Node) {
  let rightTick = "\u{2713}"
  let wrongTick = "\u{2717}"
    
  if expectedHead == outputHead {
    print("\(rightTick) Test #\(testCaseNumber)")
  } else {
    print("\(wrongTick) Test #\(testCaseNumber) Expected: \(Array(expectedHead)) Your output: \(Array(outputHead))")
  }
  testCaseNumber += 1
}

let head1 = Node.from(array: [1, 2, 8, 9, 12, 16])
let expected1 = Node.from(array: [1, 8, 2, 9, 16, 12])
let output1 = head1.reverse()
check(expected1, matches: output1)

let head2 = Node.from(array: [2, 18, 24, 3, 5, 7, 9, 6, 12])
let expected2 = Node.from(array: [24, 18, 2, 3, 5, 7, 9, 12, 6])
let output2 = head2.reverse()
check(expected2, matches: output2)

// Add your tests here


