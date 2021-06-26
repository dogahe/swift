//
//  main.swift
//  MaximalRectangle
//
//  Created by Behzad Dogahe on 6/26/21.
//

/*
 
 85. Maximal Rectangle
 
 Given a rows x cols binary matrix filled with 0's and 1's, find the largest rectangle containing only 1's and return its area.

 Example 1:
 Input: matrix = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
 Output: 6
 Explanation: The maximal rectangle is shown in the above picture.
 
 Example 2:
 Input: matrix = []
 Output: 0
 
 Example 3:
 Input: matrix = [["0"]]
 Output: 0
 
 Example 4:
 Input: matrix = [["1"]]
 Output: 1
 
 Example 5:
 Input: matrix = [["0","0"]]
 Output: 0
  
 Constraints:

 rows == matrix.length
 cols == matrix[i].length
 0 <= row, cols <= 200
 matrix[i][j] is '0' or '1'.
 
 */

func maximalRectangle(_ matrix: [[Character]]) -> Int {
    let rows = matrix.count
    if rows == 0 {
        return 0
    }
    let cols = matrix[0].count
    var intMatrix: [[Int]] = Array(repeating: Array(repeating: 0, count: cols), count: rows)
    for r in 0 ..< rows {
        for c in 0 ..< cols {
            if matrix[r][c] == "1" {
                intMatrix[r][c] = 1
            }
        }
    }
    var cumMatrix: [[Int]] = Array(repeating: Array(repeating: 0, count: cols), count: rows)
    for r in 0 ..< rows {
        for c in 0 ..< cols {
            if r == 0 {
                cumMatrix[r][c] = intMatrix[r][c]
            } else {
                if intMatrix[r][c] == 1 {
                    cumMatrix[r][c] = cumMatrix[r - 1][c] + 1
                }
            }
        }
    }
    var maxArea = 0
    for r in 0 ..< rows {
        let row = cumMatrix[r]
        let area = largestRectangleArea(row)
        maxArea = max(maxArea, area)
    }
    return maxArea
}

func largestRectangleArea(_ heights: [Int]) -> Int {
    var stack: [Int] = []
    var left: [Int] = Array(repeating: 0, count: heights.count)
    var right: [Int] = Array(repeating: 0, count: heights.count)
    for i in 0 ..< heights.count {
        if stack.isEmpty {
            left[i] = 0
            stack.append(i)
        } else {
            while !stack.isEmpty && heights[stack.last!] >= heights[i] {
                stack.removeLast()
            }
            if stack.isEmpty {
                left[i] = 0
            } else {
                left[i] = stack.last! + 1
            }
            stack.append(i)
        }
    }
    stack = []
    for index in 0 ..< heights.count {
        let i = heights.count - 1 - index
        if stack.isEmpty {
            right[i] = heights.count - 1
            stack.append(i)
        } else {
            while !stack.isEmpty && heights[stack.last!] >= heights[i] {
                stack.removeLast()
            }
            if stack.isEmpty {
                right[i] = heights.count - 1
            } else {
                right[i] = stack.last! - 1
            }
            stack.append(i)
        }
    }
    var maxArea = 0
    for i in 0 ..< heights.count {
        let area = (right[i] - left[i] + 1) * heights[i]
        maxArea = max(maxArea, area)
    }
    return maxArea
}

let matrix: [[Character]] = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]

let area = maximalRectangle(matrix)
print(area)
