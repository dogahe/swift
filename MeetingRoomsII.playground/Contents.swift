/*
 
 tags:Google
 
 253. Meeting Rooms II
 
 Given an array of meeting time intervals intervals where intervals[i] = [starti, endi], return the minimum number of conference rooms required.

 Example 1:
 Input: intervals = [[0,30],[5,10],[15,20]]
 Output: 2

 Example 2:
 Input: intervals = [[7,10],[2,4]]
 Output: 1
 Constraints:

 1 <= intervals.length <= 104
 0 <= starti < endi <= 106

Solution:
 
 Algorithm
 Sort the given meetings by their start time.
 Initialize a new min-heap and add the first meeting's ending time to the heap. We simply need to keep track of the ending times as that tells us when a meeting room will get free.
 For every meeting room check if the minimum element of the heap i.e. the room at the top of the heap is free or not.
 If the room is free, then we extract the topmost element and add it back with the ending time of the current meeting we are processing.
 If not, then we allocate a new room and add it to the heap.
 After processing all the meetings, the size of the heap will tell us the number of rooms allocated. This will be the minimum number of rooms needed to accommodate all the meetings.
 */

func minMeetingRooms(_ intervals: [[Int]]) -> Int {
    let sortedIntervals = intervals.sorted(by: { $0[0] <= $1[0] } )
    var meetingEndTimes: [Int] = []
    for interval in sortedIntervals {
        if !meetingEndTimes.isEmpty {
            var leastEndTime: Int = Int.max
            var leastEndTimeIndex: Int = -1
            for i in 0 ..< meetingEndTimes.count {
                if meetingEndTimes[i] < leastEndTime {
                    leastEndTime = meetingEndTimes[i]
                    leastEndTimeIndex = i
                }
            }
            if interval[0] >= leastEndTime {
                meetingEndTimes.remove(at: leastEndTimeIndex)
            }
        }
        meetingEndTimes.append(interval[1])
    }
    return meetingEndTimes.count
}

let intervals = [[0,30],[5,10],[15,20]]
minMeetingRooms(intervals)

let intervals2 = [[7,10],[2,4]]
minMeetingRooms(intervals2)
