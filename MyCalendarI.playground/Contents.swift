/*
 729. My Calendar I
 
 You are implementing a program to use as your calendar. We can add a new event if adding the event will not cause a double booking.

 A double booking happens when two events have some non-empty intersection (i.e., some moment is common to both events.).

 The event can be represented as a pair of integers start and end that represents a booking on the half-open interval [start, end), the range of real numbers x such that start <= x < end.

 Implement the MyCalendar class:

 MyCalendar() Initializes the calendar object.
 boolean book(int start, int end) Returns true if the event can be added to the calendar successfully without causing a double booking. Otherwise, return false and do not add the event to the calendar.
  
 Example 1:
 Input
 ["MyCalendar", "book", "book", "book"]
 [[], [10, 20], [15, 25], [20, 30]]
 Output
 [null, true, false, true]

 Explanation
 MyCalendar myCalendar = new MyCalendar();
 myCalendar.book(10, 20); // return True
 myCalendar.book(15, 25); // return False, It can not be booked because time 15 is already booked by another event.
 myCalendar.book(20, 30); // return True, The event can be booked, as the first event takes every time less than 20, but not including 20.
  

 Constraints:

 0 <= start < end <= 109
 At most 1000 calls will be made to book.

 */
class MyCalendar {

    var cal: [(Int, Int)]
    init() {
        cal = []
    }
    
    func book(_ start: Int, _ end: Int) -> Bool {
        var index = 0
        var lastEnd = -1
        while index <= cal.count {
            if index == cal.count {
                if start >= lastEnd {
                    cal.append((start, end))
                    return true
                } else {
                    return false
                }
            }
            if end <= cal[index].0 && start >= lastEnd {
                cal.insert((start, end), at: index)
                return true
            }
            lastEnd = cal[index].1
            index += 1
        }
        return false
    }
}

class MyCalendarTree {
    class TreeNode {
        var val: (Int, Int)
        var left: TreeNode?
        var right: TreeNode?
        init(_ val: (Int, Int)) {
            self.val = val
            left = nil
            right = nil
        }
    }
    
    var cal: TreeNode?
    init() {
        cal = nil
    }
    
    func book(_ start: Int, _ end: Int) -> Bool {
        if cal == nil {
            cal = TreeNode((start, end))
            return true
        }
        return insert(cal!, start, end)
    }
    
    func insert(_ node: TreeNode, _ start: Int, _ end: Int) -> Bool {
        if end <= node.val.0 {
            if node.left == nil {
                node.left = TreeNode((start, end))
                return true
            } else {
                return insert(node.left!, start, end)
            }
        } else {
            if start >= node.val.1 {
                if node.right == nil {
                    node.right = TreeNode((start, end))
                    return true
                } else {
                    return insert(node.right!, start, end)
                }
            }
        }
        return false
    }
}

let calendar = MyCalendar()
calendar.book(10, 20)
calendar.book(15, 25)
calendar.book(20, 30)


let calendar2 = MyCalendarTree()
calendar2.book(10, 20)
calendar2.book(15, 25)
calendar2.book(20, 30)

