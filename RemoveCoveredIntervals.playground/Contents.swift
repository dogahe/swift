/*
 
 Remove Covered Intervals
 Given a list of intervals, remove all intervals that are covered by another interval in the list.

 Interval [a,b) is covered by interval [c,d) if and only if c <= a and b <= d.

 After doing so, return the number of remaining intervals.


 Example 1:

 Input: intervals = [[1,4],[3,6],[2,8]]
 Output: 2
 Explanation: Interval [3,6] is covered by [2,8], therefore it is removed.
 Example 2:

 Input: intervals = [[1,4],[2,3]]
 Output: 1
 Example 3:

 Input: intervals = [[0,10],[5,12]]
 Output: 2
 Example 4:

 Input: intervals = [[3,10],[4,10],[5,11]]
 Output: 2
 Example 5:

 Input: intervals = [[1,2],[1,4],[3,4]]
 Output: 1
  

 Constraints:

 1 <= intervals.length <= 1000
 intervals[i].length == 2
 0 <= intervals[i][0] < intervals[i][1] <= 10^5
 All the intervals are unique.
 
*/

import Foundation

func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
    var sortedByStartTime = intervals.sorted { $0[0] < $1[0] }
        print(sortedByStartTime)
        var index: Int = 0
        while index < sortedByStartTime.count - 1 {
            let firstInterval = sortedByStartTime[index]
            let secondInterval = sortedByStartTime[index + 1]
            if firstInterval[0] >= secondInterval[0] && firstInterval[1]  <= secondInterval[1] {
                sortedByStartTime.remove(at: index)
                print(sortedByStartTime)
            } else if secondInterval[0] >= firstInterval[0] && secondInterval[1]  <= firstInterval[1] {
                sortedByStartTime.remove(at: index + 1)
            } else {
                index += 1
            }
        }
    print(sortedByStartTime)
    return sortedByStartTime.count
}

let intervals = [[1, 10], [2, 3], [4, 5]] //[[1,2],[1,4],[3,4]]//[[3,10],[4,10],[5,11]]//[[0,10],[5,12]]//[[1,4],[2,3]]//[[1,4],[3,6],[2,8]]

removeCoveredIntervals(intervals)