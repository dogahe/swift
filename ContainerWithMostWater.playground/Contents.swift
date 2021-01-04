/*
 
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
