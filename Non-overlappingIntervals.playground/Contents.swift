/*
 Non-overlapping Intervals
 
 Given a collection of intervals, find the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping.
 
 Example 1:
 
 Input: [[1,2],[2,3],[3,4],[1,3]]
 Output: 1
 Explanation: [1,3] can be removed and the rest of intervals are non-overlapping.
 
  Example 2:
 
 Input: [[1,2],[1,2],[1,2]]
 Output: 2
 Explanation: You need to remove two [1,2] to make the rest of intervals non-overlapping.
 
 Example 3:
 
 Input: [[1,2],[2,3]]
 Output: 0
 Explanation: You don't need to remove any of the intervals since they're already non-overlapping.
 
 Note:

 You may assume the interval's end point is always bigger than its start point.
 Intervals like [1,2] and [2,3] have borders "touching" but they don't overlap each other.
 
 */
import Foundation
func eraseOverlapIntervals(_ intervals: [(Int, Int)]) -> Int {
    var sortedByEndTime = intervals.sorted { $0.1 < $1.1 }
    print(sortedByEndTime)
    var sum: Int = 0
    var index: Int = 0
    while index < sortedByEndTime.count - 1 {
        let firstInterval = sortedByEndTime[index]
        let secondInterval = sortedByEndTime[index + 1]
        if firstInterval.0 < secondInterval.1 && firstInterval.1  > secondInterval.0 {
            sum += 1
            sortedByEndTime.remove(at: index + 1)
            print(sortedByEndTime)
        } else {
            index += 1
        }
    }
    return sum
}

//let intervals = [(1,3),(2,4),(3,5)]
//let intervals = [(1,2),(2,3),(3,4),(1,3)]
//let intervals = [(1,5),(2,4),(4,5)]
//let intervals = [(1,2),(2,3)]
let intervals = [(1,2),(1,2), (1,2)]

eraseOverlapIntervals(intervals)

