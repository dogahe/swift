//
//  main.swift
//  ShortestDistanceFromAllBuildings
//
//  Created by Behzad Dogahe on 8/31/21.
//

func shortestDistance(_ grid: [[Int]]) -> Int {
    let m = grid.count
    let n = grid[0].count
    let movements = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    var minTotalDistance = Int.max
    for i in 0 ..< m {
        for j in 0 ..< n {
            // Putting the house at location (i, j)
            if grid[i][j] == 0 {
                var distance: [[Int]]  = Array(repeating: Array(repeating: Int.max, count: n), count: m)
                distance[i][j] = 0
                var queue: [(Int, Int)] = []
                queue.append((i, j))
                while !queue.isEmpty {
                    let u = queue.removeFirst()
                    for movement in movements {
                        let nextX = u.0 + movement.0
                        let nextY = u.1 + movement.1
                        if nextX >= 0 && nextX < m && nextY >= 0 && nextY < n && grid[nextX][nextY] != 2 && grid[nextX][nextY] != 1 && distance[nextX][nextY] == Int.max {
                            distance[nextX][nextY] = distance[u.0][u.1] + 1
                            queue.append((nextX, nextY))
                        } else if nextX >= 0 && nextX < m && nextY >= 0 && nextY < n && grid[nextX][nextY] != 2 && grid[nextX][nextY] == 1 && distance[nextX][nextY] == Int.max {
                            distance[nextX][nextY] = distance[u.0][u.1] + 1
                        }
                    }
                }
                //  Find the distance between the just located house to all the other houses
                var totalDistance = 0
                outerLoop: for row in 0 ..< m {
                    for col in 0 ..< n {
                        if grid[row][col] == 1 {
                            if distance[row][col] == Int.max {
                                totalDistance = Int.max
                                break outerLoop
                            }
                            totalDistance += distance[row][col]
                        }
                    }
                }
                minTotalDistance = min(minTotalDistance, totalDistance)
            }
        }
    }
    if minTotalDistance == Int.max || minTotalDistance == 0 {
        return -1
    }
    return minTotalDistance
}

let grid = [[1,0,2,0,1],[0,0,0,0,0],[0,0,1,0,0]]
let d = shortestDistance(grid)
print(d)

let grid2 = [[1,0]]
let d2 = shortestDistance(grid2)
print(d2)

let grid3 = [[1]]
let d3 = shortestDistance(grid3)
print(d3)

let grid4 = [[0,2,1],[1,0,2],[0,1,0]]
let d4 = shortestDistance(grid4)
print(d4)

let grid5 = [[1,2,0]]
let d5 = shortestDistance(grid5)
print(d5)

let grid6 = [[0,2,1],[1,0,2],[0,1,0]]
let d6 = shortestDistance(grid6)
print(d6)

let grid7 = [[1,1],[0,1]]
let d7 = shortestDistance(grid7)
print(d7)


