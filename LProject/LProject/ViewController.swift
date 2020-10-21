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
        //var p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30, 33, 37, 41, 45, 48, 51, 55, 56, 57, 60, 63, 66, 69, 72]
        
        var p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
        print("Recursive")
        for i in 1...p.count {
            let cr = cutRod(p: p, n: i)
            print(i, cr)
        }
        print("Top-down with memoization")
        for i in 1...p.count {
            let cr = memoizedCutRod(p: p, n: i)
            print(i, cr)
        }
        print("Bottom-up")
        for i in 1...p.count {
            let cr = bottomUpCutRod(p: p, n: i)
            print(i, cr)
        }
        print("Extended Bottom-up")
        for i in 1...p.count {
            // let cr = extendedBottomUpCutRod(p: p, n: i)
            // print(i, cr)
            //  printCutRodSolution(p: p, n: i)
        }
        
        let cr = extendedBottomUpCutRod(p: p, n: 7)
        print(7, cr)
        printCutRodSolution(p: p, n: 9)
    }
        
    func cutRod(p: [Int], n: Int) -> Int {
        if n == 0 {
            return 0
        }
        var q = -1
        for i in 0..<n {
            q = max(q, p[i] + cutRod(p: p, n: n - i - 1))
        }
        return q
    }

    func memoizedCutRod(p: [Int], n: Int) -> Int {
        var r: [Int] = Array(repeating: -1, count: n + 1)
        return memoizedCutRodAux(p: p, n: n, r: &r)
    }
    
    func memoizedCutRodAux(p: [Int], n: Int, r: inout [Int]) -> Int {
        if r[n] > 0 {
            return r[n]
        }
        var q: Int
        if n == 0 {
            q = 0
        } else {
            q = -1
            for i in 0..<n {
                q = max(q, p[i] + memoizedCutRodAux(p: p, n: n - i - 1, r: &r))
            }
        }
        r[n] = q
        return q
    }

    func bottomUpCutRod(p: [Int], n: Int) -> Int {
        var r: [Int] = Array(repeating: -1, count: n + 1)
        r[0] = 0
        for j in 1...n {
            var q: Int = -1
            for i in 0..<j {
                q = max(q, p[i] + r[j - i - 1])
            }
            r[j] = q
        }
        return r[n]
    }
    
    func extendedBottomUpCutRod(p: [Int], n: Int) -> (Int, [Int]) {
        var r: [Int] = Array(repeating: -1, count: n + 1)
        var s: [Int] = Array(repeating: 0, count: n)
        r[0] = 0
        for j in 1...n {
            var q: Int = -1
            for i in 0..<j {
                if q < p[i] + r[j - i - 1] {
                    q = p[i] + r[j - i - 1]
                    s[j - 1] = i + 1
                }
            }
            r[j] = q
        }
        return (r[n], s)
    }

    
    func printCutRodSolution(p: [Int], n: Int) {
        let (r, s) = extendedBottomUpCutRod(p: p, n: n)
        print(r, s)
        var n1 = n
        while n1 > 0 {
            print(s[n1 - 1])
            n1 = n1 - s[n1 - 1]
        }
    }

}

