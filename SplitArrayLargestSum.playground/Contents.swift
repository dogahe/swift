func splitArray(_ nums: [Int], _ m: Int) -> Int {
    var minVal: Int = Int.max
    dfs(nums, 0, 0, m, 0, 0, &minVal)
    return minVal
}

func dfs(_ nums: [Int], _ index: Int, _ numOfSubArrays: Int, _ m: Int, _ currSum: Int, _ currMax: Int, _ minVal: inout Int) {
    if index == nums.count && numOfSubArrays == m {
        minVal = min(minVal, currMax)
        return
    }
    if index == nums.count {
        return
    }
    if index > 0 {
        dfs(nums, index + 1, numOfSubArrays, m, currSum + nums[index], max(currMax, currSum + nums[index]), &minVal)
    }
    if numOfSubArrays < m {
        dfs(nums, index + 1, numOfSubArrays + 1, m, nums[index],  max(currMax, nums[index]), &minVal)
    }
}


let nums = [7,2,5,10,8], m = 2
splitArray(nums, m)

let nums2 = [1,2,3,4,5], m2 = 2
splitArray(nums2, m2)

let nums3 = [1,4,4], m3 = 3
splitArray(nums3, m3)
