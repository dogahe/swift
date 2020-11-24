//
//  ViewController.swift
//  LProject
//
//  Created by Behzad Dogahe on 8/31/20.
//  Copyright © 2020 Dogahe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    public class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init() { self.val = 0; self.left = nil; self.right = nil; }
        public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
        public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
            self.val = val
            self.left = left
            self.right = right
        }
    }

    func printBST(_ root: TreeNode?) {
        if root == nil  {
            return
        }
        printBST(root?.left)
        print(root!.val)
        printBST(root?.right)
        
    }

    func insertIntoBST(_ root: inout TreeNode?, _ val: Int) -> TreeNode? {
        if let root = root {
            if val < root.val {
                root.left = insertIntoBST(&root.left, val)
            } else {
                root.right = insertIntoBST(&root.right, val)
            }
            return root
        } else {
            root = TreeNode(val)
            return root
        }
    }
    
    
    func findMinArrowShots(_ points: [[Int]]) -> Int {
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

    func removeDuplicateLetters(_ s: String) -> String {
       
        var lastIndex: [Int] = Array(repeating: -1, count: 26)
        for index in 0..<s.count {
            let letter = s[s.index(s.startIndex, offsetBy: index)]
            lastIndex[Int(letter.asciiValue! - Character("a").asciiValue!)] = index
        }
        print(lastIndex)
        
        var used: [Bool] = Array(repeating: false, count: 26)
        
        var result: String = ""
        for index in 0..<s.count {
            print(index)
            let letter = s[s.index(s.startIndex, offsetBy: index)]
            print(letter)
            if used[Int(letter.asciiValue! - Character("a").asciiValue!)] {
                continue
            }
            print(result.last)
            while result.count > 0 && (result.last ?? Character("-")) > letter && lastIndex[Int(result.last!.asciiValue! - Character("a").asciiValue!)] > index {
                used[Int(result.last!.asciiValue! - Character("a").asciiValue!)] = false
                result.removeLast()
            }
            result.append(letter)
            print(result)
            used[Int(letter.asciiValue! - Character("a").asciiValue!)] = true
            print(used)
        }
        return result
    }


    
    
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        } else if nums.count == 1 {
            return nums[0]
        }
        
        var house: [Int] = []
        
        house.append(nums[0])
        house.append(max(house[0], nums[1]))
        for i in 2 ..< nums.count {
            house.append(max(house[i - 1], nums[i] + house[i - 2]))
        }
        return house.last!
    }


    func atMostNGivenDigitSet(_ digits: [String], _ n: Int) -> Int {
        var output: String = ""
        var results: [String] = []
        doCreate(output: &output, digits: digits, level: 1, results: &results, n: n)
        print(results)
        return 0
    }
    
    func doCreate(output: inout String, digits: [String], level: Int, results: inout [String], n: Int) {
        if output.count == level {
            results.append(output)
            print(output)
            
//            if let num = Int(output) {
//                if num < n {
//                    results.append(output)
//                    print(output)
//                }
//            }
            return
        }
        for digit in digits {
            output.append(digit)
            doCreate(output: &output, digits: digits, level: level, results: &results, n: n)
            output.removeLast()
        }
        output = ""
        doCreate(output: &output, digits: digits, level: level + 1, results: &results, n: n)
    }




    override func viewDidLoad() {
        super.viewDidLoad()
        
        let digits = ["1","3","5","7"]
        let n = 100
        atMostNGivenDigitSet(digits, n)
        
        let nums = [226,174,214,16,218,48,153,131,128,17,157,142,88,43,37,157,43,221,191,68,206,23,225,82,54,118,111,46,80,49,245,63,25,194,72,80,143,55,209,18,55,122,65,66,177,101,63,201,172,130,103,225,142,46,86,185,62,138,212,192,125,77,223,188,99,228,90,25,193,211,84,239,119,234,85,83,123,120,131,203,219,10,82,35,120,180,249,106,37,169,225,54,103,55,166,124]

        print("Robbed: \(rob(nums))")
        
        
        
        print(removeDuplicateLetters("cbacdcbc"))
        
        let points = [[1,9],[7,16],[2,5],[7,12],[9,11],[2,10],[9,16],[3,9],[1,3]]

        findMinArrowShots(points)
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
        
        
        let values = [4,2,7,1,3]
        let val = 5

        var root: TreeNode? = nil

        values.forEach { value in
            insertIntoBST(&root, value)
        }
        print("####")
        printBST(root)

  

        insertIntoBST(&root, val)
        print("####")
        printBST(root)
        
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

