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

