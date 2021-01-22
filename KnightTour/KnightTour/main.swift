//
//  main.swift
//  KnightTour
//
//  Created by Behzad Dogahe on 1/20/21.
//

import Foundation

let N: Int = 8

func solveKT() -> Bool {
    var sol: [[Int]] = Array(repeating: Array(repeating: -1, count: N), count: N)
    let moves: [(Int, Int)] = [(2, 1), (2, -1), (1, 2), (1, -2), (-2, 1), (-2, -1), (-1, 2), (-1, -2)]
    
    sol[0][0] = 0
    if !solveKTUtil(0, 0, 1, &sol, moves) {
        print("Solution does not exist")
        return false
    } else {
        printSolution(sol)
    }
    return true
}

func solveKTUtil(_ x: Int, _ y: Int, _ moveI: Int, _  sol: inout [[Int]], _ moves:  [(Int, Int)]) -> Bool {
    
    if moveI == N * N {
        return true
    }
    for k in 0 ..< moves.count {
        let nextX = x + moves[k].0
        let nextY = y + moves[k].1
        if isSafe(nextX, nextY, sol) {
            sol[nextX][nextY] = moveI
            printSolution(sol)
            if solveKTUtil(nextX, nextY, moveI + 1, &sol, moves) {
                return true
            } else {
                sol[nextX][nextY] = -1
            }
            
        }
    }
    return false
}

func isSafe(_ x: Int, _ y: Int, _ sol: [[Int]]) -> Bool {
    return x >= 0 && x < N && y >= 0 && y < N && sol[x][y] == -1
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

solveKT()


