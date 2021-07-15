
func longestSubarrayFast(_ nums: [Int], _ limit: Int) -> Int {
    var left = 0
    var right = 0
    var maxQueue: [Int] = []
    var minQueue: [Int] = []
    while right < nums.count {
        while !maxQueue.isEmpty && nums[right] > maxQueue.last! {
            maxQueue.removeLast()
        }
        while !minQueue.isEmpty && nums[right] < minQueue.last! {
            minQueue.removeLast()
        }
        maxQueue.append(nums[right])
        minQueue.append(nums[right])
        if maxQueue.first! - minQueue.first! > limit {
            if maxQueue.first! == nums[left] {
                maxQueue.removeFirst()
            }
            if minQueue.first! == nums[left] {
                minQueue.removeFirst()
            }
            left += 1
        }
        right += 1
    }
    return right - left
}

func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
    var left = 0
    var right = 0
    var maxLength: Int = 1
    while right < nums.count - 1 {
        if isValid(left, right + 1, nums, limit) {
            right += 1
            maxLength = max(maxLength, right - left + 1)
        } else {
            left += 1
        }
    }
    return maxLength
}

func isValid(_ left: Int, _ right: Int, _ nums: [Int], _ limit: Int) -> Bool {
    let minVal = nums[left...right].min()!
    let maxVal = nums[left...right].max()!
    return abs(minVal - maxVal) <= limit
}

let nums1 = [8,2,4,7]
let limit1 = 4
longestSubarray(nums1, limit1)
longestSubarrayFast(nums1, limit1)

let nums2 = [10,1,2,4,7,2]
let limit2 = 5
longestSubarray(nums2, limit2)
longestSubarrayFast(nums2, limit2)

let nums3 = [4,2,2,2,4,4,2,2]
let limit3 = 0
longestSubarray(nums3, limit3)
longestSubarrayFast(nums3, limit3)
