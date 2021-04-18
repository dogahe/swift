func jump(_ nums: [Int]) -> Int {
    var results: [Int:Int] = [:]
    var min = helper(nums, 0, 0, &results)
    print(results)
    return min
}

func helper(_ nums: [Int], _ curr: Int, _ jumps: Int, _ results: inout [Int:Int]) -> Int {
    if let val = results[curr] {
        return val
    }
    if curr == nums.count - 1 {
        return jumps
    }
    var maxJumps = nums[curr]
    var minJumps = Int.max
    while maxJumps > 0 {
        if curr + maxJumps <= nums.count - 1 {
            let j = helper(nums, curr + maxJumps, jumps + 1, &results)
            minJumps = min(minJumps, j)
        }
        maxJumps -= 1
    }
    results[curr] = minJumps
    return minJumps
}

let nums = [9,8,2,2,0,2,2,0,4,1,5,7,9,6,6,0,6,5,0,5] //[2,3,1,1,4] //[2, 1]//[2,3,0,1,4]
jump(nums)


