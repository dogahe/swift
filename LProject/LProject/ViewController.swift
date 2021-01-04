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
    
    func calculate(_ s: String) -> Int {
        //let ex = s.trimmingCharacters(in: .whitespaces)
        let ex = String(s.filter { !" ".contains($0) })
        var operands: [Int] = []
        var operations: [Character] = []
        var num: Int = 0
        var i: Int = 0
        while i < ex.count {
            let c = ex[ex.index(ex.startIndex, offsetBy: i)]
            if c.isNumber {
                num = num * 10 + Int(String(c))!
            } else {
                operands.append(num)
                num = 0
                if (c == "+" || c == "-") || ((c == "*" || c == "/") && (operations.last == "*" || operations.last == "/")) {
                    if operations.count > 0 && operands.count > 1 {
                        let two = operands.removeLast()
                        let one = operands.removeLast()
                        let operation = operations.removeLast()
                        var result: Int
                        if operation == "*" {
                            result = one * two
                        } else if operation == "+" {
                            result = one + two
                        } else if operation == "-" {
                            result = one - two
                        } else {
                            result = one / two
                        }
                        operands.append(result)
                    }
                }
                operations.append(c)
            }
            i += 1
        }
        operands.append(num)
        while operations.count > 0 && operands.count > 1 {
            let two = operands.removeLast()
            let one = operands.removeLast()
            let operation = operations.removeLast()
            var result: Int
            if operation == "*" {
                result = one * two
            } else if operation == "+" {
                result = one + two
            } else if operation == "-" {
                result = one - two
            } else {
                result = one / two
            }
            operands.append(result)
        }
        return operands.last!
    }
    
    func getSkyline(_ buildings: [[Int]]) -> [[Int]] {
        if buildings.count == 0 {
            return []
        } else if buildings.count == 1 {
            if buildings[0].count == 3 {
                return [[buildings[0][0], buildings[0][2]], [buildings[0][1], 0]]
            } else {
                return []
            }
        }
        
        var edges: [Int] = []
        buildings.forEach { building in
            edges.append(building[0])
            edges.append(building[1])
        }
        edges = Array(Set(edges))
        edges.sort()
        
        let leftMost = edges[0]
        let rightMost = edges.last!
        var skies: [Int] = []
        var index: Int = 0
        while index < edges.count - 1 {
            let left = edges[index]
            let right = edges[index + 1]
            var sky: Int = 0
            for building in buildings {
                if (right > building[0] && left < building[1]) || (left < building[1] && right > building[0]) {
                    sky = max(sky, building[2])
                }
            }
            skies.append(sky)
            index += 1
        }
        print(skies)
        
        var lastSky: Int = skies[0]
        var lastEdge: Int = edges[0]
        index = 1
        var output: [[Int]] = []
        while index < skies.count {
            let sky = skies[index]
            print(sky)
            if sky != lastSky {
                output.append([lastEdge, lastSky])
                lastSky = sky
                lastEdge = edges[index]
            }
            index += 1
        }
        output.append([lastEdge, lastSky])
        output.append([rightMost, 0])
        return output
    }
    
    func generateMatrix(_ n: Int) -> [[Int]] {
        var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
        var minRow = 0
        var maxRow = n
        var minCol = -1
        var maxCol = n
        var dir = (0, 1)
        var row = 0
        var col = 0
        for num in 1 ... n*n {
            print(num)
            matrix[row][col] = num
            row += dir.0
            col += dir.1
            print(row, col)
            if dir == (0, 1) {
                if col == maxCol {
                    row += 1
                    col = maxCol - 1
                    maxCol -= 1
                    dir = (1, 0)
                }
            } else if dir == (1, 0) {
                if row == maxRow {
                    row = maxRow - 1
                    col -= 1
                    maxRow -= 1
                    dir = (0, -1)
                }
            } else if dir == (0, -1) {
                if col == minCol {
                    row -= 1
                    col = minCol +  1
                    minCol += 1
                    dir = (-1, 0)
                }
            } else if dir == (-1, 0) {
                if row == minRow {
                    row = minRow + 1
                    minRow += 1
                    col += 1
                    dir = (0, 1)
                }
            }
        }
        return matrix
    }


    func longestPalindrome(_ s: String) -> String {
        var table: [[Bool]] = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
        var maxLength = 1
        for i in 0 ..< s.count {
            table[i][i] = true
        }
        var start = 0
        if s.count > 1 {
            for i in 0 ..< s.count - 1 {
                if s[s.index(s.startIndex, offsetBy: i)] == s[s.index(s.startIndex, offsetBy: i + 1)]  {
                    table[i][i + 1] = true
                    start = i
                    maxLength = 2
                }
            }
        }
        
        if s.count > 2 {
            for k in 3 ... s.count {
                for i in 0 ..< s.count - k + 1 {
                    let j = i + k - 1
                    
                    if table[i + 1][j - 1] && s[s.index(s.startIndex, offsetBy: i)] == s[s.index(s.startIndex, offsetBy: j)] {
                        table[i][j] = true;

                        if (k > maxLength) {
                            start = i
                            maxLength = k
                        }
                    }
                }
            }
        }
        print(table)
        print(start, maxLength)
        return String(s[s.index(s.startIndex, offsetBy: start) ... s.index(s.startIndex, offsetBy: start + maxLength - 1)])
     
    }
    
    
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var stack: [Int] = []
        var maxArea = 0
        var area = 0
        var i = 0
        while i < heights.count {
            if stack.isEmpty || heights.last ?? -1 <= heights[i] {
                stack.append(i)
                i += 1
                print(stack)
            } else {
                let top = stack.popLast()
                if stack.isEmpty {
                    area = heights[top!] * i
                } else {
                    area = heights[top!] * (i  - stack.last! - 1)
                }
                maxArea = max(maxArea, area)
            }
        }
        while !stack.isEmpty {
            let top = stack.popLast()
            if stack.isEmpty {
                area = heights[top!] * i
            } else {
                area = heights[top!] * (i  - stack.last! - 1)
            }
            maxArea = max(maxArea, area)
        }
        
        return maxArea
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let h =  [2, 1, 2, 3, 1]//[2,1,5,6,2,3]

        print(largestRectangleArea(h))
        
        
        
        let s11 = "ccc"//"forgeeksskeegfor"//"babad"
        longestPalindrome(s11)

       
        
        
        generateMatrix(3)
        
        var b: [[Int]] = [[]]//[[0,2,3],[2,5,3]]//[[2,9,10],[3,7,15],[5,12,12],[15,20,10],[19,24,8]] //[[1,2,1],[2147483646,2147483647,2147483647]]//[ [2, 9, 10], [3, 7, 15], [5, 12, 12], [15, 20, 10], [19, 24, 8] ]
        
        print(getSkyline(b))
        
        let s = "1*2-3/4+5*6-7*8+9/10"
        //let s = "2*3+4"
        calculate(s)
        
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

