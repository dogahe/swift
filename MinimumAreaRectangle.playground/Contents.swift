/*
 
 tags:Google
 
 939. Minimum Area Rectangle
 
 You are given an array of points in the X-Y plane points where points[i] = [xi, yi].

 Return the minimum area of a rectangle formed from these points, with sides parallel to the X and Y axes. If there is not any such rectangle, return 0.

 Example 1:
 Input: points = [[1,1],[1,3],[3,1],[3,3],[2,2]]
 Output: 4
 
 Example 2:
 Input: points = [[1,1],[1,3],[3,1],[3,3],[4,1],[4,3]]
 Output: 2
  
 Constraints:
 1 <= points.length <= 500
 points[i].length == 2
 0 <= xi, yi <= 4 * 104
 All the given points are unique.
 
 */
func minAreaRect(_ points: [[Int]]) -> Int {
    var dict: [Int:Set<Int>] = [:]
    for point in points {
        if let val = dict[point[0]] {
            var newVal = val
            newVal.insert(point[1])
            dict[point[0]] = newVal
        } else {
            dict[point[0]] = Set([point[1]])
        }
    }
    var minArea = Int.max
    for i in 0 ..< points.count {
        for j in 0 ..< points.count {
            let p1 = points[i]
            let p2 = points[j]
            if p1[0] == p2[0] || p1[1] == p2[1] {
                continue
            }
            if dict[p1[0]]!.contains(p2[1]) && dict[p2[0]]!.contains(p1[1]) {
                minArea = min(minArea, abs((p1[0] - p2[0]) * (p2[1] - p1[1])))
            }
        }
    }
    if minArea ==  Int.max {
        return 0
    }
    return minArea
}

let points = [[1,1],[1,3],[3,1],[3,3],[2,2]]
minAreaRect(points)

let points2 = [[1,1],[1,3],[3,1],[3,3],[4,1],[4,3]]
minAreaRect(points2)
