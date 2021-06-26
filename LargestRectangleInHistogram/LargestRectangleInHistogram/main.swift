//
//  main.swift
//  LargestRectangleInHistogram
//
//  Created by Behzad Dogahe on 6/25/21.
//

/*
 84. Largest Rectangle in Histogram
 
 Given an array of integers heights representing the histogram's bar height where the width of each bar is 1, return the area of the largest rectangle in the histogram.

 Example 1:

 Input: heights = [2,1,5,6,2,3]
 Output: 10
 Explanation: The above is a histogram where width of each bar is 1.
 The largest rectangle is shown in the red area, which has an area = 10 units.
 Example 2:
 
 Input: heights = [2,4]
 Output: 4
  
 Constraints:

 1 <= heights.length <= 105
 0 <= heights[i] <= 104
 
 */

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

func largestRectangleAreaBruteForce(_ heights: [Int]) -> Int {
    var maxArea = 0
    for i in 0 ..< heights.count {
        let h = heights[i]
        var left = i
        var right = i
        while left >= 0 && heights[left] >= h {
            left -= 1
        }
        left += 1
        while right < heights.count && heights[right] >= h {
            right += 1
        }
        right -= 1
        let area = (right - left + 1) * h
        maxArea = max(maxArea, area)
    }
    return maxArea
}

let h = [6, 2, 5, 4, 5, 1, 6 ]// [2,1,5,6,2,3]//
print(largestRectangleArea(h))
print(largestRectangleAreaBruteForce(h))


