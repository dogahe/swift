/*
 tags:Google
 
 55. Jump Game
 
 You are given an integer array nums. You are initially positioned at the array's first index, and each element in the array represents your maximum jump length at that position.

 Return true if you can reach the last index, or false otherwise.

  
 Example 1:
 Input: nums = [2,3,1,1,4]
 Output: true
 Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
 
 Example 2:
 Input: nums = [3,2,1,0,4]
 Output: false
 Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.
  
 Constraints:

 1 <= nums.length <= 104
 0 <= nums[i] <= 105
 
 
 */


enum Index {
    case good
    case bad
    case unknown
}

func canJumpTopDown(_ nums: [Int]) -> Bool {
    var memo: [Index] = Array(repeating: .unknown, count: nums.count)
    memo[nums.count - 1] = .good
    return canJumpFrom(0, nums, &memo)
}

func canJumpFrom(_ position: Int, _ nums: [Int], _ memo: inout [Index]) -> Bool {
    if memo[position] != .unknown {
        return memo[position] == .good
    }
    let maxJumpPosition = min(nums.count - 1, position + nums[position])
    if maxJumpPosition >= position + 1 {
        for nextPosition in position + 1 ... maxJumpPosition {
            if canJumpFrom(nextPosition, nums, &memo) {
                memo[position] = .good
                return true
            }
        }
    }
    memo[position] = .bad
    return false
}


func canJumpBottomUp(_ nums: [Int]) -> Bool {
    var memo: [Index] = Array(repeating: .unknown, count: nums.count)
    memo[nums.count - 1] = .good
    for i in stride(from: nums.count - 2, to: -1, by: -1) {
        let maxJumpPosition = min(nums.count - 1, i + nums[i])
        if maxJumpPosition >= i + 1 {
            for j in i + 1 ... maxJumpPosition {
                if memo[j] == .good {
                    memo[i] = .good
                    break
                }
            }
        }
    }
    return memo[0] == .good
}

func canJumpFast(_ nums: [Int]) -> Bool {
    var lastJump = nums.count - 1
    for i in stride(from: nums.count - 1, to: -1, by: -1) {
        if nums[i] + i >= lastJump {
            lastJump = i
        }
    }
    return lastJump == 0
}

let nums = [2,3,1,1,4]
print(canJumpTopDown(nums))
print(canJumpBottomUp(nums))

let nums2 = [3,2,1,0,4]
print(canJumpTopDown(nums2))
print(canJumpBottomUp(nums2))
