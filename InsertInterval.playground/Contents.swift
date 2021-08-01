/*

 tags:Google
 
 Insert Interval
 
 Given a set of non-overlapping intervals, insert a new interval into the intervals (merge if necessary).

 You may assume that the intervals were initially sorted according to their start times.

 Example 1:

 Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
 Output: [[1,5],[6,9]]
 Example 2:

 Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
 Output: [[1,2],[3,10],[12,16]]
 Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].
 Example 3:

 Input: intervals = [], newInterval = [5,7]
 Output: [[5,7]]
 Example 4:

 Input: intervals = [[1,5]], newInterval = [2,3]
 Output: [[1,5]]
 Example 5:

 Input: intervals = [[1,5]], newInterval = [2,7]
 Output: [[1,7]]
  
 Constraints:

 0 <= intervals.length <= 104
 intervals[i].length == 2
 0 <= intervals[i][0] <= intervals[i][1] <= 105
 intervals is sorted by intervals[i][0] in ascending order.
 newInterval.length == 2
 0 <= newInterval[0] <= newInterval[1] <= 105
 
*/


func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    var sortedIntervals = intervals//.sorted { $0[0] <= $1[0] }
    var index: Int = 0
    while index < sortedIntervals.count {
        let first = sortedIntervals[index][0]
        if newInterval[0] < first {
            sortedIntervals.insert(newInterval, at: index)
            break
        }
        index += 1
    }
    if index == sortedIntervals.count {
        sortedIntervals.append(newInterval)
    }
    
    index = 0
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

func insert2(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    if intervals.isEmpty {
        return [newInterval]
    }
    var merged: [[Int]] = []
    var index = 0
    while index < intervals.count && intervals[index][0] <= newInterval[0] {
        merged.append(intervals[index])
        index += 1
    }
    if merged.isEmpty {
        merged.append(newInterval)
    } else {
        if newInterval[0] > merged[merged.count - 1][1] {
            merged.append(newInterval)
        } else {
            if newInterval[1] > merged[merged.count - 1][1] {
                merged[merged.count - 1] = [merged[merged.count - 1][0], newInterval[1]]
            }
        }
    }
    for i in index ..< intervals.count {
        if intervals[i][0] > merged[merged.count - 1][1] {
            merged.append(intervals[i])
        } else {
            if intervals[i][1] > merged[merged.count - 1][1] {
                merged[merged.count - 1] = [merged[merged.count - 1][0], intervals[i][1]]
            }
        }
    }
    return merged
}

let intervals = [[1,3],[6,9]]
let newInterval = [2,5]
insert(intervals, newInterval)
insert2(intervals, newInterval)

let intervals2 = [[1,2],[3,5],[6,7],[8,10],[12,16]]
let newInterval2 = [4,8]
insert(intervals2, newInterval2)
insert2(intervals2, newInterval2)

let intervals3: [[Int]] = []
let newInterval3 = [5,7]
insert(intervals3, newInterval3)
insert2(intervals3, newInterval3)
 
let intervals4 = [[1,5]]
let newInterval4 = [2,7]
insert(intervals4, newInterval4)
insert2(intervals4, newInterval4)

let intervals5 = [[1,5]]
let newInterval5 = [0,3]
insert(intervals5, newInterval5)
insert2(intervals5, newInterval5)


