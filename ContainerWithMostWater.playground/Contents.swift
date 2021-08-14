/*
 
 tags:Google
 
 11. Container With Most Water
 
 Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of the line i is at (i, ai) and (i, 0). Find two lines, which, together with the x-axis forms a container, such that the container contains the most water.

 Notice that you may not slant the container.

 Example 1:
 Input: height = [1,8,6,2,5,4,8,3,7]
 Output: 49
 Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
 
 Example 2:
 Input: height = [1,1]
 Output: 1
 
 Example 3:
 Input: height = [4,3,2,1,4]
 Output: 16
 
 Example 4:
 Input: height = [1,2,1]
 Output: 2
  
 Constraints:
 n == height.length
 2 <= n <= 105
 0 <= height[i] <= 104
 
 */

import Foundation

func maxArea(_ height: [Int]) -> Int {
    var maxArea = 0
    for i in 0 ..< height.count {
        for j in i+1 ..< height.count {
            let h1 = height[i]
            let h2 = height[j]
            let area = (j - i) * min(h1, h2)
            maxArea = max(area, maxArea)
        }
    }
    return maxArea
}

func maxAreaOrderN(_ height: [Int]) -> Int {
    var maxArea = 0
    var left = 0
    var right = height.count -  1
    while left < right {
        let h1 = height[left]
        let h2 = height[right]
        let area = (right - left) * min(h1, h2)
        maxArea = max(maxArea, area)
        if h1 <= h2 {
            left = left + 1
        } else {
            right = right - 1
        }
    }
    return maxArea
}

let height = [1,8,6,2,5,4,8,3,7]
maxAreaOrderN(height)
