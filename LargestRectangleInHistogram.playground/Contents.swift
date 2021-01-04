/*

 Largest Rectangle in Histogram
 
 Given n non-negative integers representing the histogram's bar height where the width of each bar is 1, find the area of largest rectangle in the histogram.
 
 Above is a histogram where width of each bar is 1, given height = [2,1,5,6,2,3].
 
 The largest rectangle is shown in the shaded area, which has area = 10 unit.
 
 Example:

 Input: [2,1,5,6,2,3]
 Output: 10
 
*/
import Foundation

func largestRectangleArea(_ heights: [Int]) -> Int {
    var stack: [Int] = []
    var maxArea = 0
    var area = 0
    for i in 0 ..< heights.count {
        if stack.isEmpty || heights.last ?? -1 <= heights[i] {
            stack.append(i)
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
        while !stack.isEmpty {
            let top = stack.popLast()
            if stack.isEmpty {
                area = heights[top!] * i
            } else {
                area = heights[top!] * (i  - stack.last! - 1)
            }
            maxArea = max(maxArea, area)
        }
    }
    return maxArea
}

let h =  [2,1,5,6,2,3]

largestRectangleArea(h)
