/*
 
 tags:Google
 
 42. Trapping Rain Water
 
 Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.

 Example 1:
 Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
 Output: 6
 Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.
 
 Example 2:
 Input: height = [4,2,0,3,2,5]
 Output: 9
  
 Constraints:

 n == height.length
 0 <= n <= 2 * 104
 0 <= height[i] <= 105
 
 */
func trap(_ height: [Int]) -> Int {
    var water = 0
    for i in 0 ..< height.count {
        var leftMax = 0
        var rightMax = 0
        if i > 0 {
            var j = i - 1
            while j >= 0 {
                leftMax = max(leftMax, height[j])
                j -= 1
            }
        }
        if i <  height.count - 1 {
            var j = i + 1
            while j < height.count {
                rightMax = max(rightMax, height[j])
                j += 1
            }
        }
        water += max(min(leftMax, rightMax) - height[i], 0)
    }
    return water
}

func trapFaster(_ height: [Int]) -> Int {
    var leftMaxArr: [Int] = []
    var leftMax = 0
    var rightMaxArr: [Int] = []
    var rightMax = 0
    for i in 0 ..< height.count {
        leftMaxArr.append(leftMax)
        leftMax = max(leftMax, height[i])
        rightMaxArr.insert(rightMax, at: 0)
        rightMax = max(rightMax, height[height.count - 1 - i])
    }
    var water = 0
    for i in 0 ..< height.count {
        let leftMax = leftMaxArr[i]
        let rightMax = rightMaxArr[i]
        water += max(min(leftMax, rightMax) - height[i], 0)
    }
    return water
}

let height = [0,1,0,2,1,0,1,3,2,1,2,1]
trap(height)
trapFaster(height)

let height2 = [4,2,0,3,2,5]
trap(height2)
trapFaster(height2)
