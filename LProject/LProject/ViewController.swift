//
//  ViewController.swift
//  LProject
//
//  Created by Behzad Dogahe on 8/31/20.
//  Copyright © 2020 Dogahe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let a = [[2,1,1],[1,1,0],[0,1,1]]
        orangesRotting(a)
    }
    
    func orangesRotting(_ grid: [[Int]]) -> Int {
        
        func hasBad(_ grid: [[Int]], row: Int, col: Int) -> Bool {
            let rows = grid.count
            if rows > 0 {
                let cols = grid[0].count
                if row < rows - 1 {
                    if grid[row + 1][col] == 2 {
                        return true
                    }
                }
                if row > 0 {
                    if grid[row - 1][col] == 2 {
                        return true
                    }
                }
                if col < cols - 1 {
                    if grid[row][col + 1] == 2 {
                        return true
                    }
                }
                if col > 0 {
                    if grid[row][col - 1] == 2 {
                        return true
                    }
                }
            }
            return false
        }
        
        var gridCopy = grid
        let rows = gridCopy.count
        if rows > 0 {
            let cols = gridCopy[0].count
            var somethingChanged = true
            var time = 0
            while somethingChanged {
                time += 1
                somethingChanged = false
                for i in 0..<rows {
                    for j in 0..<cols {
                        let val = gridCopy[i][j]
                        if val == 1 && hasBad(gridCopy, row: i, col: j) {
                            gridCopy[i][j] = 3
                            somethingChanged = true
                        }
                    }
                }
                print(gridCopy)
                for i in 0..<rows {
                    for j in 0..<cols {
                        if gridCopy[i][j] == 3 {
                           gridCopy[i][j] = 2
                        }
                    }
                }
            }
            return  time
        } else {
            return 0
        }
    }





}

