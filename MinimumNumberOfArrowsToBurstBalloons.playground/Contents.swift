/*

 Minimum Number of Arrows to Burst Balloons
 
 There are some spherical balloons spread in two-dimensional space. For each balloon, provided input is the start and end coordinates of the horizontal diameter. Since it's horizontal, y-coordinates don't matter, and hence the x-coordinates of start and end of the diameter suffice. The start is always smaller than the end.

 An arrow can be shot up exactly vertically from different points along the x-axis. A balloon with xstart and xend bursts by an arrow shot at x if xstart ≤ x ≤ xend. There is no limit to the number of arrows that can be shot. An arrow once shot keeps traveling up infinitely.

 Given an array points where points[i] = [xstart, xend], return the minimum number of arrows that must be shot to burst all balloons.

  

 Example 1:

 Input: points = [[10,16],[2,8],[1,6],[7,12]]
 Output: 2
 Explanation: One way is to shoot one arrow for example at x = 6 (bursting the balloons [2,8] and [1,6]) and another arrow at x = 11 (bursting the other two balloons).
 Example 2:

 Input: points = [[1,2],[3,4],[5,6],[7,8]]
 Output: 4
 Example 3:

 Input: points = [[1,2],[2,3],[3,4],[4,5]]
 Output: 2
 Example 4:

 Input: points = [[1,2]]
 Output: 1
 Example 5:

 Input: points = [[2,3],[2,3]]
 Output: 1
  

 Constraints:

 0 <= points.length <= 10^4
 points[i].length == 2
 -2^31 <= xstart < xend <= 2^31 - 1
 
*/


import Foundation

func findMinArrowShots(_ points: [[Int]]) -> Int {
    if points.count == 0 {
        return 0
    }
    var sortedByEnd = points.sorted {
        if $0[1] == $1[1] {
            return $0[0] <= $1[0]
        } else {
            return $0[1] < $1[1]
        }
    }
    print(sortedByEnd)
    var maxOverlap: Int = sortedByEnd[0][0] - 1
    var shots: Int = 0
    while sortedByEnd.count > 0 {
        let firstBalloon = sortedByEnd[0]
        if firstBalloon[0] <= maxOverlap && firstBalloon[1] >= maxOverlap {
            sortedByEnd.remove(at: 0)
            print(sortedByEnd)
            continue
        }
        if sortedByEnd.count == 1 {
            shots += 1
            print(shots)
            sortedByEnd.remove(at: 0)
            print(sortedByEnd)
        } else {
            let secondBalloon = sortedByEnd[1]
            if firstBalloon[1] >= secondBalloon[0] {
                maxOverlap = min(firstBalloon[1], secondBalloon[1])
                shots += 1
                print(shots)
                sortedByEnd.remove(at: 0)
                print(sortedByEnd)
                sortedByEnd.remove(at: 0)
                print(sortedByEnd)
            } else {
                shots += 1
                print(shots)
                sortedByEnd.remove(at: 0)
                print(sortedByEnd)
            }
        }
    }
    return shots
}

//  Simpler Solution
func findMinArrowShots2(_ points: [[Int]]) -> Int {
    if points.count == 0 {
        return 0
    }
    let sortedByEnd = points.sorted {
        if $0[1] == $1[1] {
            return $0[0] <= $1[0]
        } else {
            return $0[1] < $1[1]
        }
    }
    var arrowPosition = sortedByEnd[0][1]
    var shots: Int = 1
    for  i in 1 ..< sortedByEnd.count {
        if sortedByEnd[i][0] <= arrowPosition {
            continue
        }
        shots += 1
        arrowPosition = sortedByEnd[i][1]
    }
    return shots
}

let points =  [[10,16],[2,8],[1,6],[7,12]]//[[1,9],[7,16],[2,5],[7,12],[9,11],[2,10],[9,16],[3,9],[1,3]]
findMinArrowShots2(points)

