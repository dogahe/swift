/*
 
 tags:Google
 
 Merge Intervals
 
 Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

 Example 1:

 Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
 Output: [[1,6],[8,10],[15,18]]
 Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
 Example 2:

 Input: intervals = [[1,4],[4,5]]
 Output: [[1,5]]
 Explanation: Intervals [1,4] and [4,5] are considered overlapping.
  

 Constraints:

 1 <= intervals.length <= 104
 intervals[i].length == 2
 0 <= starti <= endi <= 104
 
 */

import Foundation

func merge(_ intervals: [[Int]]) -> [[Int]] {
    var sortedIntervals = intervals.sorted { $0[0] <= $1[0] }
    var index: Int = 0
    while index < sortedIntervals.count - 1 {
        let first = sortedIntervals[index]
        let second = sortedIntervals[index + 1]
        if first[1] >= second[0] {
            let merged = [first[0], max(first[1], second[1])]
            sortedIntervals.remove(at: index)
            sortedIntervals.remove(at: index)
            sortedIntervals.insert(merged, at: index)
        } else {
            index += 1
        }
    }
    return sortedIntervals
}

func merge2(_ intervals: [[Int]]) -> [[Int]] {
    let sortedIntervals = intervals.sorted { $0[0] <= $1[0] }
    var merged: [[Int]] = []
    merged.append(sortedIntervals[0])
    var index: Int = 1
    while index < sortedIntervals.count {
        let interval = sortedIntervals[index]
        var lastInterval = merged.last!
        if interval[0] > lastInterval[1] {
            merged.append(interval)
        } else {
            if interval[1] > lastInterval[1] {
                lastInterval = [lastInterval[0], interval[1]]
                merged[merged.count - 1] = lastInterval
            }
        }
        index += 1
    }
    return merged
}

let intervals = [[2,3],[2,2],[3,3],[1,3],[5,7],[2,2],[4,6]]//[[1,4],[4,5]]//[[1,3],[2,6],[8,10],[15,18]]

merge(intervals)
merge2(intervals)
