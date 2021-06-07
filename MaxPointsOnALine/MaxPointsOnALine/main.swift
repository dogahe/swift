//
//  main.swift
//  MaxPointsOnALine
//
//  Created by Behzad Dogahe on 6/4/21.
//

/*
 
 149. Max Points on a Line
 
 Given an array of points where points[i] = [xi, yi] represents a point on the X-Y plane, return the maximum number of points that lie on the same straight line.

  

 Example 1:
 
 Input: points = [[1,1],[2,2],[3,3]]
 Output: 3
 
 Input: points = [[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]
 Output: 4
  

 Constraints:

 1 <= points.length <= 300
 points[i].length == 2
 -104 <= xi, yi <= 104
 All the points are unique.
 
 */
func maxPoints(_ points: [[Int]]) -> Int {
    if points.count == 1 || points.count == 2  {
        return points.count
    }
    var maxSize = 0
    for i in 0 ..< points.count - 1 {
        for j in i + 1 ..< points.count {
            let p1 = points[i]
            let p2 = points[j]
            let a = Double(p1[1] - p2[1])/Double(p1[0] - p2[0])
            let b = Double(p1[1]) - a*Double(p1[0])
            var size = 0
            for k in 0 ..< points.count {
                let p = points[k]
                if p1[0] == p2[0] {
                    if p[0] == p1[0] {
                        size += 1
                    }
                } else {
                    if abs((a*Double(p[0]) + b - Double(p[1]))) < 0.000001 {
                        size += 1
                    }
                }
            }
            maxSize = max(maxSize, size)
        }
    }
    return maxSize
}

let points = [[0, 0]]//[[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]//[[1,1],[2,2],[3,3]]
print(maxPoints(points))

