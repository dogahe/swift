/*
 
 252. Meeting Rooms
 
 Given an array of meeting time intervals where intervals[i] = [starti, endi], determine if a person could attend all meetings.

 Example 1:
 Input: intervals = [[0,30],[5,10],[15,20]]
 Output: false
 
 Example 2:
 Input: intervals = [[7,10],[2,4]]
 Output: true
  
 Constraints:

 0 <= intervals.length <= 104
 intervals[i].length == 2
 0 <= starti < endi <= 106

 */
func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
    if intervals.count < 2 {
        return true
    }
    let sortedIntervals = intervals.sorted(by: { $0[0] < $1[0] })
    for i in 0 ..< sortedIntervals.count - 1 {
        let first = sortedIntervals[i]
        let second = sortedIntervals[i + 1]
        if !(second[0] >= first[1]) {
            return false
        }
    }
    return true
}

let intervals = [[0,30],[5,10],[15,20]]
canAttendMeetings(intervals)

let intervals2 = [[7,10],[2,4]]
canAttendMeetings(intervals2)
