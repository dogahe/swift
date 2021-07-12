//
//  main.swift
//  SegmentsCovering
//
//  Created by Behzad Dogahe on 7/11/21.
//
/*
 You are given a set of closed line segments, represented as a two-dimensional integer array segments. Each segment segments[i] is of the form [l, r], where l is the coordinate of its left endpoint and r is the coordinate of its right endpoint.

 Let's say that the segment [l, r] contains the point x if the point is located inside the segment, i.e. l ≤ x ≤ r. Your task is to find the minimal number of points that can be placed somewhere on the number line, so that each segment contains at least one point.

 Example

 For

 segments = [[-1, 3],
             [-5, -3],
             [3, 5],
             [2, 4],
             [-3, -2],
             [-1, 4],
             [5, 5]]
 the output should be segmentsCovering(segments) = 3.

 You can place 3 points, at positions -3, 3, and 5 to fit the requirement:

 Segment [-1, 3] will contain point 3;
 Segment [-5, -3] will contain point -3;
 Segment [3, 5] will contain points 3 and 5;
 Segment [2, 4] will contain point 3;
 Segment [-3, -2] will contain point -3;
 Segment [-1, 4] will contain point 3;
 Segment [5, 5] will contain point 5.
 example

 You cannot place 2 points or fewer to cover all segments, because segments [-5, -3], [2, 4], and [5, 5] have no points in common. So, the answer is 3.

 Input/Output

 [execution time limit] 5 seconds (swift)

 [input] array.array.integer segments

 An array of arrays of integers, representing the set of closed line segments.

 Guaranteed constraints:
 1 ≤ segments.length ≤ 105,
 segments[i].length = 2,
 -109 ≤ segments[i][0] ≤ segments[i][1] ≤ 109.

 [output] integer

 An integer representing the minimum number of points to cover all the given segments.
 
 */
func segmentsCovering(segments: [[Int]]) -> Int {
    var sortedSegments = segments.sorted { $0[0] <= $1[0] }
    var index: Int = 0
    while index < sortedSegments.count - 1 {
        let first = sortedSegments[index]
        let second = sortedSegments[index + 1]
        if first[1] >= second[0] {
            let intersection = [second[0], min(first[1], second[1])]
            sortedSegments.remove(at: index)
            sortedSegments.remove(at: index)
            sortedSegments.insert(intersection, at: index)
        } else {
            index += 1
        }
    }
    return sortedSegments.count
}

let segments = [[-1, 3],
                [-5, -3],
                [3, 5],
                [2, 4],
                [-3, -2],
                [-1, 4],
                [5, 5]]

let points = segmentsCovering(segments: segments)
print(points)
