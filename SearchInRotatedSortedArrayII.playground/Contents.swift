import Foundation

func search(_ nums: [Int], _ target: Int) -> Bool {
    var left: Int = 0
    var right: Int = nums.count - 1
    while left <= right {
        let mid = (left + right)/2
        if nums[mid] == target {
            return true
        }
        if nums[left] < nums[mid] {
            if target >= nums[left] && target < nums[mid] {
                right = mid - 1
            } else {
                left = mid + 1
            }
        } else if nums[left] > nums[mid] {
            if target > nums[mid] && target <= nums[right] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        } else {
            left += 1
        }
    }
    return false
}

let nums = [2,5,6,0,0,1,2]
let target = 3

search(nums, target)
