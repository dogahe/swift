//
//  main.swift
//  Maze
//
//  Created by Behzad Dogahe on 1/21/21.
//

import Foundation

let N: Int = 6

func solveMaze(_ maze: [[Int]]) -> Bool {
    var sol: [[Int]] = Array(repeating: Array(repeating: 0, count: N), count: N)
    sol[0][0] = 1
    if !solveMazeUtil(0, 0, &sol, maze) {
        print("Solution does not exist")
        return false
    } else {
        printSolution(sol)
    }
    return true
}

func solveMazeUtil(_ x: Int, _ y: Int, _  sol: inout [[Int]], _ maze: [[Int]]) -> Bool {
    printSolution(sol)
    if x == N - 1 && y == N - 1 && maze[x][y] == 1 {
        return true
    }
    
    let moves: [(Int, Int)] = [(1, 0), (0, 1)]
    for k in 0 ..< moves.count {
        let nextX = x + moves[k].0
        let nextY = y + moves[k].1
        if isSafe(nextX, nextY, maze) {
            sol[nextX][nextY] = 1
            if solveMazeUtil(nextX, nextY, &sol, maze) {
                return true
            } else {
                sol[nextX][nextY] = 0
            }
        }
    }
    return false
}

func isSafe(_ x: Int, _ y: Int, _ maze: [[Int]]) -> Bool {
    return x >= 0 && x < N && y >= 0 && y < N && maze[x][y] == 1
}

func printSolution(_ sol: [[Int]]) {
    var str: String = ""
    for x in 0 ..< N {
        for y in 0 ..< N {
            str += "\(sol[x][y]) "
        }
        str += "\n"
    }
    print(str)
}

/*
let maze: [[Int]] =  [ [1, 0, 0, 0],
                       [1, 1, 0, 1],
                       [0, 1, 0, 0],
                       [1, 1, 1, 1] ]
 */

let maze: [[Int]] =  [ [1, 1, 1, 0, 1, 1],
                       [1, 0, 1, 1, 1, 1],
                       [1, 1, 0, 1, 0, 0],
                       [1, 1, 0, 1, 1, 1],
                       [1, 1, 1, 1, 0, 1],
                       [1, 1, 0, 1, 0, 1]]

solveMaze(maze)


func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var path: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
    path[0][0] = 1
    var paths: [[[Int]]] = []
    uniquePathsUtil(0, 0, m, n, &path, &paths)
    return paths.count
}

func uniquePathsUtil(_ x: Int, _ y: Int, _ m: Int, _ n: Int, _ path: inout [[Int]], _ paths: inout [[[Int]]]) {
    if x == m - 1 && y == n - 1 && path[x][y] == 1 {
        paths.append(path)
        return
    }
    let moves: [(Int, Int)] = [(1, 0), (0, 1)]
    for k in 0 ..< moves.count {
        let nextX = x + moves[k].0
        let nextY = y + moves[k].1
        if isPathSafe(nextX, nextY, m, n) {
            path[nextX][nextY] = 1
            uniquePathsUtil(nextX, nextY, m, n, &path, &paths)
        }
    }
    
}

func isPathSafe(_ x: Int, _ y: Int, _ m: Int, _ n: Int) -> Bool {
    return x >= 0 && x < m && y >= 0 && y < n
}

let pathsCount = uniquePaths(3,3)
print(pathsCount)
