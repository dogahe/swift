
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
                memo[nextPosition] = .good
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
    
    for i in 0 ... nums.count - 2 {
        let maxJumpPosition = min(nums.count - 1, i + nums[nums.count - 2 - i])
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


let nums = [2,3,1,1,4]
print(canJumpTopDown(nums))
print(canJumpBottomUp(nums))

let nums2 = [3,2,1,0,4]
print(canJumpTopDown(nums2))
print(canJumpBottomUp(nums2))
