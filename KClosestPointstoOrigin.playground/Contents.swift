/*
 
 tags:Google
 
 973. K Closest Points to Origin
 
 Given an array of points where points[i] = [xi, yi] represents a point on the X-Y plane and an integer k, return the k closest points to the origin (0, 0).
 
 The distance between two points on the X-Y plane is the Euclidean distance (i.e, √(x1 - x2)2 + (y1 - y2)2).
 
 You may return the answer in any order. The answer is guaranteed to be unique (except for the order that it is in).
 
 
 
 Example 1:
 
 
 Input: points = [[1,3],[-2,2]], k = 1
 Output: [[-2,2]]
 Explanation:
 The distance between (1, 3) and the origin is sqrt(10).
 The distance between (-2, 2) and the origin is sqrt(8).
 Since sqrt(8) < sqrt(10), (-2, 2) is closer to the origin.
 We only want the closest k = 1 points from the origin, so the answer is just [[-2,2]].
 Example 2:
 
 Input: points = [[3,3],[5,-1],[-2,4]], k = 2
 Output: [[3,3],[-2,4]]
 Explanation: The answer [[-2,4],[3,3]] would also be accepted.
 
 
 Constraints:
 
 1 <= k <= points.length <= 104
 -104 < xi, yi < 104
 
 
 */
import UIKit

func partition(_ arr: inout [Point], _ p: Int, _ r: Int) -> Int {
    let x = arr[r]
    var i = p - 1
    for j in p ... r - 1 {
        if arr[j].distance <= x.distance {
            i += 1
            let temp = arr[i]
            arr[i] = arr[j]
            arr[j] = temp
        }
    }
    let temp = arr[i + 1]
    arr[i + 1] = arr[r]
    arr[r] = temp
    return i + 1
}

func randomizedPartition(_ arr: inout [Point], _ p: Int, _ r: Int) -> Int {
    let i = Int.random(in: p ... r)
    let temp = arr[i]
    arr[i] = arr[r]
    arr[r] = temp
    return partition(&arr, p, r)
}

func randomizedSelect(_ arr: inout [Point], _ p: Int, _ r: Int, _ i: Int) -> Point {
    if p == r {
        return arr[p]
    }
    let q = randomizedPartition(&arr, p, r)
    let k = q - p + 1
    if i == k {
        return arr[q]
    } else if i < k {
        return randomizedSelect(&arr, p, q - 1, i)
    } else {
        return randomizedSelect(&arr, q + 1, r, i - k)
    }
}

struct Point {
    let coord: [Int]
    let distance: Int
}

func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
    var distances: [Point] = points.map { Point(coord: $0, distance: $0[0]*$0[0] + $0[1]*$0[1]) }
    
    randomizedSelect(&distances, 0, distances.count - 1, k)
    return Array(distances.map( { $0.coord } ).prefix(k))
}

let points = [[3,3],[5,-1],[-2,4]]
let k = 2
kClosest(points, k)
