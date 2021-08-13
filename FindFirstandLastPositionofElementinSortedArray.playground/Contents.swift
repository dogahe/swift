import Foundation

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    if nums.count == 0 {
        return [-1, -1]
    }
    var left = 0
    var right = nums.count - 1
    var mid: Int = 0
    while left <= right {
        mid = (left + right)/2
        if nums[mid] == target {
            break
        } else if nums[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    if nums[mid] == target {
        left = mid
        right = mid
        while left > -1 && nums[left] == target {
            left -= 1
        }
        left += 1
        while right < nums.count && nums[right] == target {
            right += 1
        }
        right -= 1
        return [left, right]
    } else {
        return [-1, -1]
    }
}



func searchRangeFaster(_ nums: [Int], _ target: Int) -> [Int] {
    if nums.count == 0 {
        return [-1, -1]
    }
    let firstIndex = searchIndex(nums, target, isFirst: true)
    if firstIndex == -1 {
        return [-1, -1]
    }
    let lastIndex = searchIndex(nums, target, isFirst: false)
    return [firstIndex, lastIndex]
}

func searchIndex(_ nums: [Int], _ target: Int, isFirst: Bool) -> Int {
    var left = 0
    var right = nums.count - 1
    var mid: Int = 0
    while left <= right {
        mid = (left + right)/2
        if nums[mid] == target {
            if isFirst {
                if mid == left || nums[mid - 1] != target {
                    return mid
                } else {
                    right = mid - 1
                }
            } else {
                if mid == right || nums[mid + 1] != target  {
                    return mid
                } else {
                    left = mid + 1
                }
            }
        } else if target > nums[mid] {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return -1
}

let nums = [5,7,7,8,8,10]
let target = 7

searchRange(nums, target)
searchRangeFaster(nums, target)
